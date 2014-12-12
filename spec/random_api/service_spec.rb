require "spec_helper"

describe RandomApi::Service do
  it { should respond_to(:user) }

  describe "#user" do
    let(:service) { RandomApi::Service.new }

    it "should return a user" do
      expect(service.user).to be_a(RandomApi::User)
    end

    it "should accept options" do
      expect(service.user(gender: "female").gender).to eq("female")
      expect(service.user(gender: "male").gender).to eq("male")
    end
  end

  describe "#users" do
    let(:service) { RandomApi::Service.new }

    it "should return more than one user" do
      expect(service.users(10).length).to eq(10)
    end

    it "should accept options" do
      male = "male" * 10
      female = "female" * 10
      expect(service.users(10, gender: "male").map(&:gender).join).to eq(male)
      expect(service.users(10, gender: "female").map(&:gender).join).to eq(female)
    end
  end
end