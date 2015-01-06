class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.bonnier_token = auth['credentials']['token']
      if auth['info']
         user.name = auth['info']['first_name'] || ""
      end
    end
  end

  def update_with_omniauth!(auth)
    self.provider = auth['provider']
    self.uid = auth['uid']
    self.bonnier_token = auth['credentials']['token']
    if auth['info']
       self.name = auth['info']['first_name'] || ""
    end
    self.save!
  end

  def sync_with_bonnier
    client = Bonnier.client(:access_token => self.bonnier_token)
    user_json = client.user self.uid
    update_with_bonnier!(user_json)
    self
  end

private
  def update_with_bonnier!(bonnier_user)
    self.name =bonnier_user.user.first_name
    self.save!
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
