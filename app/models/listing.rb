class Listing < ApplicationRecord
  #ASSOCIATIONS
  has_one :sale
  # belongs_to :category
  belongs_to :seller, :class_name => 'User', :foreign_key => 'seller_id'

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
    # search.values.join("-").to_date
  end

  def self.check_in_date(search)
    where('check_in > ?', search)
  end

  #ACTIVE STORAGE ASSOCIATION TO ADD IMAGES
  # has_many_attached :photos

  #VALIDATORS
  validates :value, presence: true
  validates :price, presence: true
  validates :title , presence: true
  validates :description, presence: true
  validates :check_in, presence: true
  validates :check_out, presence: true

  #CUSTOM VALIDATOR
  validate :check_out_date_cannot_be_before_check_in
  validate :check_in_cannot_be_in_the_past
  validate :maximum_value_is_80_percent_of_price


  #CUSTOM VALIDATOR METHOD
  def check_out_date_cannot_be_before_check_in
    if self.check_out < self.check_in
      errors.add(:check_out, "cannot be before check in")
    end
  end

  def check_in_cannot_be_in_the_past
    if self.check_in.past?
      errors.add(:check_in, "cannot be in the past!")
    end
  end

  def maximum_value_is_80_percent_of_price
    if self.price.to_f / self.value.to_f > 0.8
      errors.add(:price, "has to be at least 80% of value (original price)")
    end
  end

  def status
    if self.sale
      "Sold"
    else
      "Not sold"
    end
  end


end
