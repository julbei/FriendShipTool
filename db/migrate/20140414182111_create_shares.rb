class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.belongs_to :accounting, index: true
      t.belongs_to :lender
      t.belongs_to :borrower
      t.decimal :amount

      t.timestamps
    end
  end
end
