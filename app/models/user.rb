class User < ApplicationRecord
  # attr_accessor :encrypted_password
  #
  # EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  has_many :sales
  has_many :listings


  validates :email, uniqueness: { case_sensitive: false }
  # validates :encrypted_password, :confirmation => true #encrypted_password_confirmation attr
  # validates_length_of :encrypted_password, :in => 6..20, :on => :create

  # Select all of current user's posted listings
  def all_my_listings
    Listing.where(seller_id: self.id)
  end

  # Select all of current user's listings where the check out is before the
  # current date
  def my_past_listings
    all_my_listings.select do |listing|
      listing.check_out < Time.now.strftime('%a, %d %b %Y').to_date
    end
  end

  # Select all stays bought by current user
  def all_my_stays
    stays = Sale.where(buyer_id: self.id)

    stays.map do |stay|
      stay.listing
    end
  end

  # Select all past stays bought by current user
  def my_past_stays
    all_my_stays.select do |stay|
      stay.check_out < Time.now.strftime('%a, %d %b %Y').to_date
    end
  end


end
