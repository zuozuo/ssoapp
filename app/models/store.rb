class Store < ActiveRecord::Base
  has_many :addresses, as: :addressable
end
