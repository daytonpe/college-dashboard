class CreateChecklists < ActiveRecord::Migration[5.0]
  def change
    create_table :checklists do |t|
      t.boolean :c1, :default =>false
      t.boolean :c2, :default =>false
      t.boolean :c3, :default =>false
      t.boolean :c4, :default =>false
      t.boolean :c5, :default =>false
      t.boolean :c6, :default =>false
      t.boolean :c7, :default =>false
      t.boolean :c8, :default =>false
      t.boolean :c9, :default =>false
      t.boolean :c10, :default =>false
      t.boolean :c11, :default =>false
      t.boolean :c12, :default =>false
      t.boolean :c13, :default =>false
      t.boolean :c14, :default =>false
      t.boolean :c15, :default =>false
      t.boolean :c16, :default =>false
      t.boolean :c17, :default =>false
      t.boolean :c18, :default =>false
      t.boolean :c19, :default =>false
      t.boolean :c20, :default =>false
      t.boolean :c21, :default =>false
      t.boolean :c22, :default =>false
      t.boolean :c23, :default =>false
      t.boolean :c24, :default =>false
      t.boolean :c25, :default =>false
      t.boolean :c26, :default =>false
      t.boolean :c27, :default =>false
      t.boolean :c28, :default =>false
      t.boolean :c29, :default =>false
      t.boolean :c30, :default =>false
      t.boolean :c31, :default =>false
      t.boolean :c32, :default =>false
      t.boolean :c33, :default =>false
      t.boolean :c34, :default =>false
      t.boolean :c35, :default =>false
      t.boolean :c36, :default =>false
      t.boolean :c37, :default =>false
      t.integer :count, :default => 0
      t.references :user, foreign_key: true
      t.references :college, foreign_key: true

      t.timestamps
    end
  end
end
