Deface::Override.new(
  virtual_path: "spree/users/show",
  name: "add_avatar_to_users_show",
  insert_top: "div.account-page>div.row:first",
  template: "spree/users/avatar_show",
)