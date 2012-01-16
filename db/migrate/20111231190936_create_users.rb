class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :facebook_user_id
      t.string :name
      t.timestamps
    end
  end
end
