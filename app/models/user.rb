class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :profile_url, :password_confirmation, :remember_me
  has_many :art
  has_many :favorites
  has_many :favorite_arts, :through => :favorites, :source => :art
  has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
  has_many :followings, :through => :relationships, :source => :followed
  has_many :reverse_relationships, :foreign_key => "followed_id", :class_name => "Relationship", :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower

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
