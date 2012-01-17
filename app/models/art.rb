class Art < ActiveRecord::Base
  belongs_to :user
  has_many :favorite
  validates :user_id, :title, :description, :art1_type, :art1_info, :art2_type, :art2_info, :category, :presence => true

  define_index do
    indexes title
    indexes description
    indexes art1_info
    indexes art2_info

    has user_id, created_at, updated_at
  end

  def self.before(date)
    where("created_at >=?", date)
  end
    
end
