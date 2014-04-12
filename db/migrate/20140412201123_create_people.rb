class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.belongs_to :user
      t.belongs_to :group
      t.decimal :balance

      t.timestamps
    end
  end
end
