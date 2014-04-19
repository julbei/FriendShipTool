class Accounting < ActiveRecord::Base
  belongs_to :group
  belongs_to :person
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :shares, dependent: :destroy
  has_many :borrowers, through: :shares, foreign_key: "borrower_id", :class_name => "Person"
  
  accepts_nested_attributes_for :shares
  
  before_save :update_persons
  
  
  private
  def update_persons
    self.person.set_balance
    
    self.borrowers.each do |person|
      person.set_balance
    end
  end
end
