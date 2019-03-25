class User < ApplicationRecord
  attr_accessor :encrypted_password

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  has_many :listings
  has_many :holidays


  validates :email, uniqueness: { case_sensitive: false }
  validates :encrypted_password, :confirmation => true #encrypted_password_confirmation attr
  validates_length_of :encrypted_password, :in => 6..20, :on => :create



end
