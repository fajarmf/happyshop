class Transaction < ActiveRecord::Base
  attr_accessible :amount, :buyer_user_id, :product_id, :seller_user_id, :status, :type
  TYPES = ['Customer Purchase','Vendor Fees','Vendor Refund']
  PURCHASE_TYPE = 0
  FEE_TYPE = 1
  REFUND_TYPE = 2

  validates_presence_of :status, :type, :amount, :buyer_user_id, :seller_user_id, :product_id

end
