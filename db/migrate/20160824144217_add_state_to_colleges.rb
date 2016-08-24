class AddStateToColleges < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :state, :string
  end
end
