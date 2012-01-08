class User < ActiveRecord::Base
  validates :id, :presence => true
  has_many :art
end
