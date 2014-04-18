class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.belongs_to :user, index: true
      t.belongs_to :group, index: true
      t.decimal :balance

      t.timestamps
    end
  end
end
