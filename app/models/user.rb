class User < ActiveRecord::Base

  def self.create_with_omniauth(auth_hash)
  self.create(provider: auth_hash[:provider],
              uid: auth_hash[:uid],
              name: auth_hash[:info][:name])
end

  has_many :posts
  has_many :comments

end
