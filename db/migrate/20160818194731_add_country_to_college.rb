class AddCountryToCollege < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :country, :string
  end
end
