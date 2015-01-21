class Store < ActiveRecord::Base
  has_many :users
  has_many :manager
  has_many :customers
  has_many :front_deskers

  has_many :addresses, as: :addressable
end
