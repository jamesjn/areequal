class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :art
  has_many :favorites
  has_many :favorite_arts, :through => :favorites, :source => :art
  has_many :followers, :class_name => "Followings", :foreign_key => "user_id"
  has_many :followings, :class_name => "Followings", :foreign_key => "follower_id"

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)

    data = access_token.extra.raw_info
    if user = User.where(:email => data.email).first
      user
    else
      User.create!(:email => data.email, :password => Devise.friendly_token[0,20])
    end
  end

  def self.find_for_open_id(access_token, signed_in_resource=nil)
  data = access_token.info
  if user = User.where(:email => data["email"]).first
    user
  else
    User.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
  end
end 

end
