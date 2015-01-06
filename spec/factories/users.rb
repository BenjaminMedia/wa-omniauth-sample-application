FactoryGirl.define do
  factory :user do
    name "Test User"
  end
end

# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  provider      :string(255)
#  uid           :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  bonnier_token :string(255)
#
