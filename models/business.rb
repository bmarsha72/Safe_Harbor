class Business < Sequel::Model
  one_to_one :contact
end
