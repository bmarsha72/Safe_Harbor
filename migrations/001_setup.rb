require 'sequel'

Sequel.migration do
  change do
    create_table(:businesses) do
      primary_key :id
      String :username
      String :password
      String :email
      String :phone
      String :address
      String :city
      String :zip
      String :business_name
      String :latitude
      String :longitude
      Boolean :single_user
    end

    create_table(:contacts) do
      primary_key :id
      String :name
      String :phone
      Boolean :on_location
      foreign_key :business_id, :businesses
    end
  end
end
