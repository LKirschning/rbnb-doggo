class RemoveLocationFromDogs < ActiveRecord::Migration[6.1]
  def change
    remove_column :dogs, :location
  end
end
