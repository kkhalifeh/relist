class Listing < ApplicationRecord
  has_one :sale
  belongs_to :user

  def self.active_listings
    self.all.select do |listing|
      Sale.where(listing_id: "#{listing.id}").empty?
    end
  end

end
