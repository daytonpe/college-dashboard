class AddZipToColleges < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :zip, :string
  end
end
