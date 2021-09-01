class OrderSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :total
  has_many :order_items
end
