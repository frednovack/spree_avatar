Deface::Override.new(
  virtual_path: "spree/admin/users/index",
  name: "add_avatar_header_to_users_table",
  insert_top: '#listing_users [data-hook="admin_users_index_headers"]',
  text: '<th data-hook="admin_users_index_avatar"></th>',
  original: '3ea9526890b728700da55ea33992e4e48ef028a8'
)


Deface::Override.new(
  virtual_path: "spree/admin/users/index",
  name: "add_avatar_image_to_users_table",
  insert_top: '#listing_users [data-hook="admin_users_index_rows"]',
  partial: "spree/admin/users/avatar_thumb",
  original: '50f9e985c422fb0c7c4e3e390fc6acc3df676218'
)