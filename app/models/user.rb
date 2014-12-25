class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['first_name'] || ""
      end
    end
  end

  def update_with_omniauth(auth)
    self.provider = auth['provider']
    self.uid = auth['uid']
    if auth['info']
       self.name = auth['info']['first_name'] || ""
    end
    self.save!
  end

end
