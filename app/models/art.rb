class Art < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :title, :description, :art1_type, :art1_info, :art2_type, :art2_info, :category, :tags, :presence => true
end
