class Person < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  has_many :accountings
end
