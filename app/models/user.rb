class User < ApplicationRecord
  has_secure_password
  # attr_accessor :encrypted_password
  #
  # EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  has_many :sales
  has_many :listings



  validates :name, presence: true
  validates :password, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
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
      # Refactor Time.now.str... x4 into ApplicationRecord as session[:current_date] or just current_date?
      listing.check_out < current_time
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
      stay.check_out < current_time
    end
  end

  #All Active Listings ever created (sold or not sold)
  def active_listings
    all_my_listings.select do |listing|
      listing.check_in >= current_time
    end
  end

  #All Active stays
  def all_active_bought_listings
    all_my_stays.select do |stay|
      stay.check_in >= current_time
    end
  end

  def total_sales
    all_sales = Sale.where(seller_id: self.id)
    all_sales.inject(0) {
      |sum, sale| sum + sale.listing.price
    }
  end

  def total_spent
    all_my_stays_price = all_my_stays.map do |listing|
      listing.price
    end
    all_my_stays_price.inject do |sum, price|
      sum += price
    end
  end

  def largest_discount
    discounts = all_my_stays.map do |listing|
      listing.value - listing.price
    end
    discounts.max
  end

  def average_discount
    discounts = all_my_stays.map do |listing|
      listing.value - listing.price
    end
    sum_discounts = discounts.inject do |sum, discount|
      sum += discount
    end
    sum_discounts.to_f / discounts.length
  end

  def total_saved
    discounts = all_my_stays.map do |listing|
      listing.value - listing.price
    end
    discounts.inject do |sum, discount|
      sum += discount
    end
  end

  def average_guests
    all_my_guests = all_my_stays.map do |listing|
      listing.guest
    end
    sum_guests = all_my_guests.inject do |sum, guest|
      sum += guest
    end
    sum_guests.to_f / all_my_guests.length
  end

  private

  def current_time
    Time.now.strftime('%a, %d %b %Y').to_date
  end

end
