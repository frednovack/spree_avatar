Deface::Override.new(
  virtual_path: "spree/users/show",
  name: "add_avatar_to_account",
  insert_bottom: "div.account-page .col-lg-4:first",
  partial: "spree/users/show_avatar",
)