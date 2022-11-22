class CreateSpices < ActiveRecord::Migration[7.0]
  def change
    create_table :spices do |t|
      t.string :title
      t.string :image
      t.string :description
      t.string :notes
      t.float :rating

      t.timestamps
    end
  end
end
