require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it { should have_many(:goals) }

  it "creates a password digest" do
    User.create!(username: "test_user", password: "password")
    user = User.find_by_username("test_user")
    expect(user.password_digest).to_not be_nil
  end

  it "ensures a session token before validation" do
    User.create!(username: "test_user", password: "password")
    user = User.find_by_username("test_user")
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe "#reset_token!" do
    it "sets a new session token" do
      User.create!(username: "test_user", password: "password")
      user = User.find_by_username("test_user")
      user.valid?
      old_token = user.session_token
      user.reset_token!

      expect(user.session_token).to_not eq(old_token)
    end

    it "returns the new session token" do
      User.create!(username: "test_user", password: "password")
      user = User.find_by_username("test_user")
      expect(user.reset_token!).to eq(user.session_token)
    end
  end

  describe "#is_password" do
    it "returns true if the password is correct" do
      User.create!(username: "test_user", password: "password")
      user = User.find_by_username("test_user")
      expect(user.is_password?("password")).to be true
    end
  end

  describe ".find_by_credentials" do
    it "returns user if valid credentials" do
      User.create!(username: "test_user", password: "password")
      user = User.find_by_username("test_user")
      found_user = User.find_by_credentials("test_user", "password")
      expect(found_user).to eq(user)
    end

    it "returns nil if invalid credentials" do
      User.create!(username: "test_user", password: "password")
      found_user = User.find_by_credentials("test_user", "alskdfjlkdjf")
      expect(found_user).to be_nil
    end

  end
end
