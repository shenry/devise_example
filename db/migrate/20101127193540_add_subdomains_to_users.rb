class AddSubdomainsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :subdomain_id, :integer
  end

  def self.down
    remove_column :users, :subdomain_id
  end
end
