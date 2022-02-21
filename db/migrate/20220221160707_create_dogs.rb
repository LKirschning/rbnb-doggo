class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.integer :price
      t.string :name
      t.string :gender
      t.string :breed
      t.string :age
      t.string :size
      t.string :description
      t.string :profile_picture
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
