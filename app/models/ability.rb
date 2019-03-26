# class Ability
#   include CanCan::Ability
#
#   def initialize(user)
#     if user ||= User.new
#       can :edit, Listing do |listing|
#           listing.seller_id == user.id
#       end
#     end
#   end
# end
