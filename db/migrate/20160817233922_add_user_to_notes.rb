class AddUserToNotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :notes, :college, foreign_key: true
  end
end
