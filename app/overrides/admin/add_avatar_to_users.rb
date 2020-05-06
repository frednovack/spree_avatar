Deface::Override.new(
  virtual_path: "spree/admin/users/index",
  name: "add_avatar_header_to_users_table",
  set_attributes: '#listing_users [data-hook="admin_users_index_headers"] th:first',
  attributes: {colspan: "2"}
)


Deface::Override.new(
  virtual_path: "spree/admin/users/index",
  name: "add_avatar_image_to_users_table",
  insert_top: '#listing_users [data-hook="admin_users_index_rows"]',
  partial: "spree/admin/users/avatar_thumb",
  original: '50f9e985c422fb0c7c4e3e390fc6acc3df676218'
)