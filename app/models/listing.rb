class Listing < ApplicationRecord
  has_one :sale
  belongs_to :user

  # Transform start date and return a string, e.g. "12 20 2019"
  def start_date_string
    self.start_date.split("/")
  end

  # Transform end date and return a string, e.g. "01 01 2020"
  def end_date_string
    self.end_date.split("/")
  end

  # Transform start date and return a string, e.g. "December 20, 2019"
  def display_start_date
    "#{display_month(start_date_string)} #{start_date_string[1]}, #{start_date_string[2]}"
  end

  # Transform end date and return a string, e.g. return "January 1, 2020"
  def display_end_date
    "#{display_month(end_date_string)} #{end_date_string[1]}, #{end_date_string[2]}"
  end

  # Transform and return current date for internal sorting, e.g. "112020"
  def start_date_for_sort
    start_month = start_date_string[0].to_i
    start_day = start_date_string[1].to_i
    start_year = start_date_string[2].to_i
    "#{start_month} #{start_day} #{start_year}".split.join.to_i
  end

  # Iterate over and select all future listings. Return an array.
  def self.future_listings
    self.all.select do |listing|
      listing.start_date_for_sort > ApplicationRecord.current_date_for_sort
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
