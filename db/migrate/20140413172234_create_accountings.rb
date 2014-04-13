class CreateAccountings < ActiveRecord::Migration
  def change
    create_table :accountings do |t|
      t.string :name
      t.text :description
      t.belongs_to  :group
      t.belongs_to  :person
      t.decimal :amount
      t.datetime :date

      t.timestamps
    end
  end
end
