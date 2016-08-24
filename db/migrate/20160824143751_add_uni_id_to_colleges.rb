class AddUniIdToColleges < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :uni_id, :integer
  end
end
