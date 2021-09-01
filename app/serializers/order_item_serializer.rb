class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :order_id, :item_id, :quantity, :price, :tax
end
