class AddPostcodeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :postcode, :string
    add_column :users, :address, :string
  end
end