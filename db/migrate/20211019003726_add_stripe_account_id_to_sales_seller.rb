class AddStripeAccountIdToSalesSeller < ActiveRecord::Migration[5.2]
  def change
    add_column :sales_sellers, :stripe_account_id, :string
  end
end
