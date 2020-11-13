require 'rails_helper'

RSpec.describe User, :type => :model do

  
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:session_token) }
  it { should validate_presence_of(:password_digest) }
  
  describe "uniqueness" do

    before :each do
      create :user
      # create is a factorybot method. It corresponds to User.create in ActiveRecord
      # build is the factorybot method which corresponds with User.new
    end
    # before :each will run this code before each it block. Data does not persist between blocks

    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
  end

  it { should validate_length_of(:password).is_at_least(6) }

  it { should belong_to(:location) }
  it { should have_many(:drops) }
  
  describe "User#is_password" do
    let(:user) { create :user }
    # creates a user variable using our user factory

    context "with valid password" do
      it "should return true" do
        expect(user.is_password?("starwars")).to be true
      end
    end
    
    context "with invalid password" do
      it "should return false" do
        expect(user.is_password?("anything but starwars")).to be false
      end
    end

  end

end