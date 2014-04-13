class CreateAccountings < ActiveRecord::Migration
  def change
    create_table :accountings do |t|
      t.string :name
      t.belongs_to  :group
      t.belongs_to  :person
      t.decimal :amount
      t.date :date

      t.timestamps
    end
  end
end
