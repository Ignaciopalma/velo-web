class CreateClientCompanies < ActiveRecord::Migration
  def change
    create_table :client_companies do |t|
    	t.string :client_companies, :last_name
	    t.string :client_companies, :contact_name
	    t.string :client_companies, :company_name
	    t.integer :client_companies, :rut
	    t.string :client_companies, :address
	    t.string :client_companies, :email
	    t.integer :client_companies, :contact_number
	    t.integer :client_companies, :payment_day
	    t.string :client_companies, :ocupation

      t.timestamps null: false
    end
  end
end
