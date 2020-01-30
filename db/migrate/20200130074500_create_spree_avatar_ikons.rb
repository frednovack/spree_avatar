class CreateSpreeAvatarIkons < ActiveRecord::Migration[5.2]
  def self.up
    create_table :spree_avatar_ikons do |t|
      t.references :user
      t.boolean    :is_ikon,    default: false
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :spree_avatar_ikons
  end
end
