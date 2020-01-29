module Spree::UserDecorator
  def self.prepended(base)
    base.has_one_attached :picture, dependent: :destroy
		base.validates :picture, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
														 size: { less_than: 5.megabytes }
  end

end

Spree::User.prepend Spree::UserDecorator