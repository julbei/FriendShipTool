class Group < ActiveRecord::Base
  has_many :persons, dependent: :destroy
  has_many :accountings, dependent: :destroy
  has_many :tags
end
