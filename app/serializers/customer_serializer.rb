class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :active
  has_many :orders  
end
