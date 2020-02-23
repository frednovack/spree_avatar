Deface::Override.new(
  virtual_path: "spree/users/show",
  name: "add_avatar_to_account",
  insert_after: "div.account-page>div>.col-lg-4",
  partial: "spree/users/show_avatar",
)