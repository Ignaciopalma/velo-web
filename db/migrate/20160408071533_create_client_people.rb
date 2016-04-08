class CreateClientPeople < ActiveRecord::Migration
  def change
    create_table :client_people do |t|
	    t.string :client_people, :last_name
	    t.string :client_people, :name
	    t.integer :client_people, :rut
	    t.integer :client_people, :number
	    t.string :client_people, :email


      t.timestamps null: false
    end
  end
end
