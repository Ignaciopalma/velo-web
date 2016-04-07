class AddFieldsToBikers < ActiveRecord::Migration
  def change
    add_column :bikers, :last_name, :string
    add_column :bikers, :bank, :string
    add_column :bikers, :rut, :integer
    add_column :bikers, :ocupation, :string
    add_column :bikers, :acc_type, :string
    add_column :bikers, :acc_number, :integer
    add_column :bikers, :address, :string
  end
end
