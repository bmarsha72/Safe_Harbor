class Business < Sequel::Model
  one_to_one :contact
  plugin :json_serializer
end
