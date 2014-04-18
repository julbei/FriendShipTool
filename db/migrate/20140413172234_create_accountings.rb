class CreateAccountings < ActiveRecord::Migration
  def change
    create_table :accountings do |t|
      t.string :name
      t.text :description
      t.belongs_to  :group, index: true
      t.belongs_to  :person, index: true
      t.decimal :amount
      t.datetime :date

      t.timestamps
    end
  end
end
