class Group < ActiveRecord::Base
  has_many :persons, dependent: :destroy
end
