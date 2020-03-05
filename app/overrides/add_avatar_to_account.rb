Deface::Override.new(
  virtual_path: "spree/users/show",
  name: "add_avatar_to_account",
  insert_top: "div.account-page > div.row:first-of-type",
  partial: "spree/users/show_avatar",
)