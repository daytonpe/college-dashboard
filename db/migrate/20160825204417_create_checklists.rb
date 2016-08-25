class CreateChecklists < ActiveRecord::Migration[5.0]
  def change
    create_table :checklists do |t|
      t.boolean :c1
      t.boolean :c2
      t.boolean :c3
      t.boolean :c4
      t.boolean :c5
      t.boolean :c6
      t.boolean :c7
      t.boolean :c8
      t.boolean :c9
      t.boolean :c10
      t.boolean :c11
      t.boolean :c12
      t.boolean :c13
      t.boolean :c14
      t.boolean :c15
      t.boolean :c16
      t.boolean :c17
      t.boolean :c18
      t.boolean :c19
      t.boolean :c20
      t.boolean :c21
      t.boolean :c22
      t.boolean :c23
      t.boolean :c24
      t.boolean :c25
      t.boolean :c26
      t.boolean :c27
      t.boolean :c28
      t.boolean :c29
      t.boolean :c30
      t.boolean :c31
      t.boolean :c32
      t.boolean :c33
      t.boolean :c34
      t.boolean :c35
      t.boolean :c36
      t.boolean :c37
      t.integer :count
      t.references :user, foreign_key: true
      t.references :college, foreign_key: true

      t.timestamps
    end
  end
end
