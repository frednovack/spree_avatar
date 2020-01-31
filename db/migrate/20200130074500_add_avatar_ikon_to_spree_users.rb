class AddAvatarIkonToSpreeUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_users, :avatar_ikon, :boolean, default: false
  end
end
