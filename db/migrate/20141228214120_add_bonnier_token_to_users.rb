class AddBonnierTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bonnier_token, :string, default: nil
  end
end
