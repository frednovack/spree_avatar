module Spree::UserDecorator
  def self.prepended(base)
    base.has_one_attached :picture, dependent: :destroy
  end
end

Spree::User.prepend Spree::UserDecorator