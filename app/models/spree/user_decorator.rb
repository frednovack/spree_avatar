module Spree::UserDecorator
  def self.prepended(base)
    base.has_one_attached :avatar, dependent: :destroy
    base.validates :avatar, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 5.megabytes }
  end
end
Spree::User.prepend Spree::UserDecorator
