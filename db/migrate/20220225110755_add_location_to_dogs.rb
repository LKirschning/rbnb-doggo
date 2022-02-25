class AddLocationToDogs < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :location, :string
  end
end
