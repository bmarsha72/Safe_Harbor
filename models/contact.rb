class Contact < Sequel::Model
  one_to_one :business
end
