class AddCityToColleges < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :city, :string
  end
end
