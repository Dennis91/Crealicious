class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :title
      t.text :description
      t.string :images
      t.string :theme
      t.string :occasion

      t.timestamps
    end
  end
end
