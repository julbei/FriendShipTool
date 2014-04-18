class Person < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  has_many :accountings
  
  has_many :lendings, foreign_key: "borrower_id", :class_name => "Share"
  has_many :borrowings, foreign_key: "lender_id", :class_name => "Share"
  has_many :lenders, through: :lendings, foreign_key: "lender_id", :class_name => "Person"
  has_many :borrowers, through: :borrowings, foreign_key: "borrower_id", :class_name => "Person"
  
  after_initialize do |person|
    person.set_balance
  end
  
  def display_name
    name
  end
  
  def set_balance
    self.balance = self.borrowers.sum(:amount) - self.lenders.sum(:amount)
    save
  end
end
