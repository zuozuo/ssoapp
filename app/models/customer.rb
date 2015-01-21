class Customer < User
  has_many :addresses, as: :addressable
end
