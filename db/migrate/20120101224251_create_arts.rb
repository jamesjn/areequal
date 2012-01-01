class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.string :art1_type
      t.string :art1_info
      t.string :art2_type
      t.string :art2_info
      t.string :category
      t.string :tags
      t.string :status

      t.timestamps
    end
  end
end
