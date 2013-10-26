class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :image
      t.integer :case_id
      
      t.timestamps
    end
  end
end
