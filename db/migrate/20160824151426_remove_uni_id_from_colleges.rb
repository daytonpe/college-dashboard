class RemoveUniIdFromColleges < ActiveRecord::Migration[5.0]
  def change
    remove_column :colleges, :uni_id, :string
  end
end
