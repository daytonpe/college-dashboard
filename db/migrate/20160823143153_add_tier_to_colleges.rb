class AddTierToColleges < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :tier, :string
  end
end
