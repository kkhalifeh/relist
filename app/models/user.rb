class User < ApplicationRecord
  has_secure_password

  has_many :sales
  has_many :listings

  #ACTIVE STORAGE ASSOCIATION TO ADD IMAGES
  has_one_attached :profile_photo

  validates :name, presence: true
  validates :password, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }

  # Select all of current user's posted listings
  def all_listings
    Listing.where(seller_id: self.id)
  end

  # Select all of current user's listings where the check out is before the
  # current date
  def past_listings
    all_listings.select do |listing|
      # Refactor Time.now.str... x4 into ApplicationRecord as session[:current_date] or just current_date?
      listing.check_out < current_time
    end
  end

  # Select all of current user's listings where the check out is after the
  # current date
  def active_listings
    all_listings.select do |listing|
      listing.check_in >= current_time
    end
  end

  # Select all trips bought by current user
  def all_trips
    my_trips = Sale.where(buyer_id: self.id)

    my_trips.map do |listing|
      listing.listing
    end
  end

  # Select all past trips bought by current user
  def past_trips
    all_trips.select do |listing|
      listing.check_out < current_time
    end
  end

  # Select all active trips bought by current user
  def active_trips
    all_trips.select do |listing|
      listing.check_in >= current_time
    end
  end

  # Analytic Methods

  # Total money earned on listings
  def total_sales
    all_sales = Sale.where(seller_id: self.id)
    all_sales.inject(0) do |sum, sale|
      sum + sale.listing.price
    end
  end

  #Total money spent on trips
  def total_spent
    all_trips.inject(0) do |sum, listing|
      sum += listing.price
    end
  end

  #Largest amount saved on a trip (as a buyer)
  def largest_discount
    if discounts.length == 0 
      return "Buy a trip!"
    else 
      discounts.max
    end
  end

  #Average discount for all trips (as a buyer)
  def average_discount
    if discounts.length == 0 
      return "Buy a trip!"
    else
      sum_discounts = discounts.inject do |sum, discount|
        sum += discount
      end
      sum_discounts.to_f / discounts.length
    end
  end

  #Total amount saved on all bought trips
  def total_saved
    if discounts.length == 0 
      return "Buy a trip!"
    else
      discounts.inject do |sum, discount|
        sum += discount
      end
    end
  end

  #Average number of guests for bought trips
  def average_guests
    if all_trips.length == 0
      return "Buy a trip!"
    else
      sum_guests = all_trips.inject(0) do |sum, listing|
        sum += listing.guest
      end
      sum_guests.to_f / all_trips.length
    end
  end
  
  private

  def current_time
    Time.now.strftime('%a, %d %b %Y').to_date
  end

  # Helper Method to get all discounts in an array (as a buyer)
  def discounts
    all_trips.map do |listing|
      listing.value - listing.price
    end
  end
end
