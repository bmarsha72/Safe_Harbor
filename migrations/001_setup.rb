Sequel.migration do
  change do
    create_table(:owner) do
      primary_key :id
      String :username
      String :password
      String :email
      String :phone
    end

    create_table(:business) do
      primary_key :id
      foreign_key :owner
      foreign_key :contact
      foreign_key :security
      Integer :taxid
      String :address
      FixNum :zip
      String :businessname
    end

    create_table(:security) do
      primary_key :id
      String :type
    end

    create_table(:contact) do
      primary_key :id
      String :name
      String :phone
    end
  end
end
