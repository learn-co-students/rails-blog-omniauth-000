class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  def self.create_with_omniauth(auth_hash)
    User.create(provider: auth_hash["provider"], name: auth_hash["info"]["name"], uid: auth_hash["uid"])
  end

end
