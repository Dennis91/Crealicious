class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :description
      t.integer :score
      t.integer :case_id

      t.timestamps
    end
  end
end
