module Spree
  class AvatarIkon < Spree::Base
    belongs_to :user, class_name: Spree.user_class.name
    validates :is_ikon, inclusion: { in: [ true, false ] }
  end
end