class AddPhoneToColleges < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :phone, :string
  end
end
