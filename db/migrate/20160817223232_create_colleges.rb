class CreateColleges < ActiveRecord::Migration[5.0]
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :web_page

      t.timestamps
    end
  end
end
