class CreateJoinTableCollegeUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :colleges, :users do |t|
      # t.index [:college_id, :user_id]
      # t.index [:user_id, :college_id]
    end
  end
end
