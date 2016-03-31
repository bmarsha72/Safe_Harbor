class Contact < Sequel::Model
  one_to_one :business
  plugin :json_serializer
end
