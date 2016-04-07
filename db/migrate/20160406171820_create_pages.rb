class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
    	t.string :email
    	t.string :name
    	t.integer :number
      t.timestamps null: false
    end
  end
end
