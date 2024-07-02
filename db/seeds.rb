# frozen_string_literal: true

# user1 = User.find_or_create_by! first_name: 'Anas', last_name: 'Ahmad', email: 'ahmadanas4490@gmail.com', password: '123456', password_confirmation: '123456'
# user2 = User.find_or_create_by! first_name: 'John', last_name: 'Doe', email: 'ahmadanas4490+1@gmail.com', password: '123456', password_confirmation: '123456'

item1 = Item.find_or_create_by!(name: 'Coffee', price: 100, tax: 10, category: :beverages)
item2 = Item.find_or_create_by!(name: 'Sugar', price: 120, tax: 10, category: :beverages)
item3 = Item.find_or_create_by!(name: 'aab',  price: 50, tax: 5, category: :beverages)
item4 = Item.find_or_create_by!(name: 'bbb',  price: 60, tax: 5, category: :beverages)

deal1 = Deal.find_or_create_by!(name: 'Deal 1')
deal2 = Deal.find_or_create_by!(name: 'Deal 2')

DealItem.find_or_create_by!(deal_id: deal1.id, item_id: item1.id, is_free: true)
DealItem.find_or_create_by!(deal_id: deal1.id, item_id: item2.id, is_free: false)

DealItem.find_or_create_by!(deal_id: deal2.id, item_id: item3.id, is_free: false, discount_percentage: 10)
DealItem.find_or_create_by!(deal_id: deal2.id, item_id: item4.id, is_free: false)
