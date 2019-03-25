class Sale < ApplicationRecord
  #ASSOCIATIONS
  belongs_to :listing
  belongs_to :seller, :class_name => 'User', :foreign_key => 'seller_id'
  belongs_to :buyer, :class_name => 'User', :foreign_key => 'buyer_id'

  #CUSTOM VALIDATOR
  validate :buyer_and_seller_cannot_be_the_same

  #CUSTOM VALIDATOR METHOD
  def buyer_and_seller_cannot_be_the_same
    if self.seller_id == self.buyer_id
      errors.add(:buyer, "you already own this listing")
    end
  end
end
