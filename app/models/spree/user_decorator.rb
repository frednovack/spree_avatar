module Spree::UserDecorator
  def self.prepended(base)
    base.has_one_attached :picture, dependent: :destroy
		base.validates :picture, content_type: :image
  end
end

Spree::User.prepend Spree::UserDecorator