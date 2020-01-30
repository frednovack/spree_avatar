module Spree::UserDecorator
  def self.prepended(base)
    base.has_one_attached :avatar, dependent: :destroy
    base.has_one :avatar_ikon, dependent: :destroy, class_name: "Spree::AvatarIkon"

    base.accepts_nested_attributes_for :avatar_ikon
		base.validates :avatar, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
														 size: { less_than: 5.megabytes }
  end
end
Spree::User.prepend Spree::UserDecorator