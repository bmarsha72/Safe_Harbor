Sequel.migration do
  change do
    create_table(:business) do
      primary_key :id
      foreign_key :contact
      String :username
      String :password
      String :email
      String :phone
      String :address
      String :zip
      String :businessname
    end

    create_table(:contact) do
      primary_key :id
      String :name
      String :phone
    end
  end
end