class CreateSalesSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_sellers do |t|
      t.string :nome
      t.string :cpf
      t.integer :telefone
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
