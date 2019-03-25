class Listing < ApplicationRecord
  has_one :sale
  belongs_to :user
  belongs_to :category

  # Bootstrap Datepicker (https://bootstrap-datepicker.readthedocs.io/en/latest/)
  # creates a nice UI calendar we could use to receive check in and check out input
  # I think it comes in the format "mm/dd/yyyy"
  # The below logic should handle that format. If we can customize the Bootstrap
  # Datepicker default, we can change and simplify these methods

  # Transform check in and return a string, e.g. "MM DD YYYY"
  def check_in_string
    self.check_in.split("/")
  end

  # Transform check out and return a string, e.g. "MM DD YYYY"
  def check_out_string
    self.check_out.split("/")
  end

  # Transform check in and return a string, e.g. "December 20, 2019"
  def display_check_in
    "#{display_month(check_in_string)} #{check_in_string[1]}, #{check_in_string[2]}"
  end

  # Transform check out and return a string, e.g. return "January 1, 2020"
  def display_check_out
    "#{display_month(check_out_string)} #{check_out_string[1]}, #{check_out_string[2]}"
  end

  # Transform and return check in for internal sorting, leading zeros removed
  # i.e. "MMDDYYYY", "MDDYYYY", "MMDYYYY", or "MDYYYY"
  def check_in_for_sort
    start_month = check_in_string[0].to_i
    start_day = check_in_string[1].to_i
    start_year = check_in_string[2].to_i
    "#{start_month} #{start_day} #{start_year}".split.join.to_i
  end

  # Iterate over and select all future listings. Return an array.
  def self.future_listings
    self.all.select do |listing|
      listing.check_in_for_sort > ApplicationRecord.current_date_for_sort
    end
  end

  # Iterate over and select all unsold listings. Return an array.
  def self.unsold_listings
    self.all.select do |listing|
      Sale.where(listing_id: "#{listing.id}").empty?
    end
  end

  # Iterate over and select all future AND unsold listings. Return an array.
  def self.active_listings
    self.future_listings.select do |listing|
      self.unsold_listings.include?(listing)
    end
  end

end
