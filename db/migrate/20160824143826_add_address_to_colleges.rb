class AddAddressToColleges < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :address, :string
  end
end
