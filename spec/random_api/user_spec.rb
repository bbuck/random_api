require "spec_helper"

describe RandomApi::User do
  subject { RandomApi::User.new(stub_user_return) }
  it { should respond_to(:gender, :title, :first_name, :last_name, :name,
                         :address, :street, :city, :state, :zip, :email,
                         :username, :password, :salt, :md5, :sha1, :sha256,
                         :registered, :dob, :phone, :cell, :ssn, :large_picture,
                         :medium_picture, :thumbnail, :api_version, :seed,
                         :api_response) }

  describe "#initialize" do
    describe "should load from api response" do
      let(:user) { RandomApi::User.new(stub_user_return) }

      it "should contain user data" do
        expect(user.gender).to eq("female")
        expect(user.name).to eq("Ms. Lois Williams")
        expect(user.title).to eq("Ms.")
        expect(user.first_name).to eq("Lois")
        expect(user.last_name).to eq("Williams")
        expect(user.address).to eq({
          "street" => "1969 Elgin St",
          "city" => "Frederick",
          "state" => "Delaware",
          "zip" => "56298"
        })
        expect(user.street).to eq("1969 Elgin St")
        expect(user.city).to eq("Frederick")
        expect(user.state).to eq("Delaware")
        expect(user.zip).to eq("56298")
        expect(user.email).to eq("lois.williams50@example.com")
        expect(user.username).to eq("heavybutterfly920")
        expect(user.password).to eq("enterprise")
        expect(user.salt).to eq(">egEn6YsO")
        expect(user.md5).to eq("2dd1894ea9d19bf5479992da95713a3a")
        expect(user.sha1).to eq("ba230bc400723f470b68e9609ab7d0e6cf123b59")
        expect(user.sha256).to eq("f4f52bf8c5ad7fc759d1d4156b25a4c7b3d1e2eec6c92d80e508aa0b7946d4ba")
        expect(user.registered.strftime("%s")).to eq("1288182167")
        expect(user.dob.strftime("%s")).to eq("146582153")
        expect(user.phone).to eq("(555)-942-1322")
        expect(user.cell).to eq("(178)-341-1520")
        expect(user.ssn).to eq("137-37-8866")
        expect(user.large_picture).to eq("http://api.randomuser.me/portraits/women/55.jpg")
        expect(user.medium_picture).to eq("http://api.randomuser.me/portraits/med/women/55.jpg")
        expect(user.thumbnail).to eq("http://api.randomuser.me/portraits/thumb/women/55.jpg")
        expect(user.api_version).to eq("0.4.1")
        expect(user.seed).to eq("graywolf")
        expect(user.api_response).to eq(stub_user_return)
      end
    end
  end
end