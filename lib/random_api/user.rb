require "random_api/invalid_user_data"
require "random_api/json_object"

class RandomApi::User < JsonObject
  map_method :seed, "$.seed"
  map_method :gender, "$.user.gender"
  map_method :name, "$.user.name", ->(val) { [val["title"] == "miss" ? val["title"] : val["title"] + ".", val["first"], val["last"]].map(&:capitalize).join(" ") }
  map_method :title, "$.user.name.title", ->(val) { (val == "miss" ? val : val + ".").capitalize }
  map_method :first_name, "$.user.name.first", ->(val) { val.capitalize }
  map_method :last_name, "$.user.name.last", ->(val) { val.capitalize }
  map_method :address, "$.user.location", ->(val) { val.inject({}) { |h, (k, v)| h[k] = v.split(" ").map(&:capitalize).join(" "); h } }
  map_method :street, "$.user.location.street", ->(val) { val.split(" ").map(&:capitalize).join(" ") }
  map_method :city, "$.user.location.city", ->(val) { val.capitalize.split(" ").map(&:capitalize).join(" ") }
  map_method :state, "$.user.location.state", ->(val) {val.capitalize.split(" ").map(&:capitalize).join(" ") }
  map_method :zip, "$.user.location.zip"
  map_method :email, "$.user.email"
  map_method :username, "$.user.username"
  map_method :password, "$.user.password"
  map_method :salt, "$.user.salt"
  map_method :md5, "$.user.md5"
  map_method :sha1, "$.user.sha1"
  map_method :sha256, "$.user.sha256"
  map_method :registered, "$.user.registered", ->(val) { DateTime.strptime(val, "%s").to_time }
  map_method :dob, "$.user.dob", ->(val) { DateTime.strptime(val, "%s").to_time }
  map_method :phone, "$.user.phone"
  map_method :cell, "$.user.cell"
  map_method :ssn, "$.user.SSN"
  map_method :large_picture, "$.user.picture.large"
  map_method :medium_picture, "$.user.picture.medium"
  map_method :thumbnail, "$.user.picture.thumbnail"
  map_method :api_version, "$.user.version"
  map_method :api_response, "$"
end