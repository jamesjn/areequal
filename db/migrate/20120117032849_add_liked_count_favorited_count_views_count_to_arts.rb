class AddLikedCountFavoritedCountViewsCountToArts < ActiveRecord::Migration
  def change
    add_column :arts, :liked_count, :integer
    add_column :arts, :favorited_count, :integer
    add_column :arts, :views, :integer
  end
end
