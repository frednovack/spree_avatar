Spree::User.class_eval do

  has_one_attached :avatar, dependent: :destroy

end
