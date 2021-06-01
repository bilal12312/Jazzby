Rails.application.routes.draw do
 
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'carts/show'
  devise_for :users
  resources :products
  root 'products#index'
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"
  

  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"

  resources :orders
  
  # button_to "Add to cart", line_items_path(:product_id => product.id)
  # link_to "Add (+1)", line_item_add_path(:id => line_item), method: :post
  # link_to "Reduce (-1)", line_item_reduce_path(:id => line_item), method: :post
  # link_to "Remove item", line_item_path(line_item), method: :delete
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
