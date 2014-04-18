class Share < ActiveRecord::Base
  belongs_to :accounting
  belongs_to :borrower, class_name: "Person",
                       foreign_key: "borrower_id"
                      
  belongs_to :lender  , class_name: "Person",
                       foreign_key: "lender_id"

end
