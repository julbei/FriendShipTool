class Tag < ActiveRecord::Base
  belongs_to :group
  has_many :taggings
  has_many :accountings, through: :taggings
end
