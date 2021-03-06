require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end

  describe 'creation' do
    it 'can be created' do
      expect(@user).to be_valid
    end
  end

  describe 'validation' do
    it 'cannot be created without first name' do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it 'cannot be created without last name' do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it 'cannot be created without phone number' do
      @user.phone = nil
      expect(@user).to_not be_valid
    end

    it  'requires the phone attr to only contain integers' do
      @user.phone = 'myrealstr'
      expect(@user).to_not be_valid
    end

    it 'requires the phone attr to only have 9 chars' do
      @user.phone = '1234567890'
      expect(@user).to_not be_valid
    end

    it 'cannot be created without ssn number' do
      @user.ssn = nil
      expect(@user).to_not be_valid
    end

    it  'requires the ssn attr to only contain integers' do
      @user.ssn = 'myrealstr'
      expect(@user).to_not be_valid
    end

    it 'requires the ssn attr to only have 4 chars' do
      @user.phone = '1234567890'
      expect(@user).to_not be_valid
    end

    it 'cannot be created without company' do
      @user.company = nil
      expect(@user).to_not be_valid
    end
  end

  describe 'custom name methods' do
    it 'has a full name method that combines first and last name' do
      expect(@user.full_name).to eq("SNOW, JON")
    end
  end

  describe 'relationship between admins and employees' do
    it 'allows for admins to be associated with multiple employees' do
      employee_1 = create(:user)
      employee_2 = create(:user)
      admin = create(:admin_user)
      Hand.create(user_id: admin.id, hand_id: employee_1.id)
      Hand.create(user_id: admin.id, hand_id: employee_2.id)

      expect(admin.hands.count).to eq(2)
    end
  end
end
