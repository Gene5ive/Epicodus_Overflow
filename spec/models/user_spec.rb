require 'rails_helper'

describe User do
  context 'validations' do
    before { FactoryGirl.build(:user) }

    it { should validate_presence_of :user_name }
    it { should validate_presence_of :email }
  end
end
