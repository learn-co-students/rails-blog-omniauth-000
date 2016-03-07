class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  def self.find_or_create_from_auth_hash(auth_hash)
    if !!User.find_by(uid: auth_hash["uid"])
      @user = User.find_by(uid: auth_hash["uid"])
    else
      create_with_omniauth(auth_hash)
    end
  end

  def self.create_with_omniauth(auth_hash)
      @user = User.create({
        :provider => auth_hash["provider"],
        :uid => auth_hash["uid"],
        :name => auth_hash["info"]["name"]
        #t.nickname = auth_hash["info"]["nickname"]
        #t.email = auth_hash["info"]["email"]
        })
  end

end