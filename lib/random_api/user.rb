require "random_api/invalid_user_data"

class RandomApi::User
  attr_accessor :gender, :title, :first_name, :last_name, :name, :street, :city,
                :state, :zip, :email, :username, :password, :salt, :md5, :sha1,
                :sha256, :registered, :dob, :phone, :cell, :ssn, :large_picture,
                :medium_picture, :thumbnail, :api_version, :seed, :api_response

  def initialize(user_obj)
    begin
      load_from_api_response(user_obj)
    rescue Exception
      raise RandomApi::InvalidUserData, "The user data given is not of the correct format to be parsed."
    end
  end

  def to_s
    name
  end

  def inspect
    "#<RandomApi::User version=#{api_version} \"#{name}\">"
  end

  def to_s
    name
  end

  def inspect
    "#<RandomApi::User version=#{api_version} \"#{name}\">"
  end

  private

  def load_from_api_response(user_obj)
    self.api_response = user_obj
    self.seed = user_obj["seed"]
    user_data = user_obj["user"]
    user_data.each do |key, value|
      next if ["name", "dob", "registered"].include?(key)
      key = key.to_s.downcase
      if respond_to?("#{key}=", true)
        send("#{key}=", value)
      end
    end
    self.title = user_data["name"]["title"]
    self.title += "." unless title == "miss"
    self.title.capitalize!
    self.first_name = user_data["name"]["first"].capitalize
    self.last_name = user_data["name"]["last"].capitalize
    self.name = "#{title} #{first_name} #{last_name}"
    self.dob = DateTime.strptime(user_data["dob"], "%s").to_time
    self.registered = DateTime.strptime(user_data["registered"], "%s").to_time
    self.street = user_data["location"]["street"].split(" ").map(&:capitalize).join(" ")
    self.city = user_data["location"]["city"].capitalize
    self.state = user_data["location"]["state"].capitalize
    self.zip = user_data["location"]["zip"]
    self.large_picture = user_data["picture"]["large"]
    self.medium_picture = user_data["picture"]["medium"]
    self.thumbnail = user_data["picture"]["thumbnail"]
    self.api_version = user_data["version"]
  end
end