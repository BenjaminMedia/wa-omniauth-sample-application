describe User do

  before(:each) { @user = FactoryGirl.create(:user) }

  subject { @user }

  it { should respond_to(:name) }

  it "#name returns a string" do
    expect(@user.name).to match 'Test User'
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
