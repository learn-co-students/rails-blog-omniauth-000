class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  def self.create_with_omniauth(auth_hash)
    self.create(provider: auth_hash[:provider],
                uid: auth_hash[:uid],
                name: auth_hash[:info][:name])
  end

end
