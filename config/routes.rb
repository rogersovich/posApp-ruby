Rails.application.routes.draw do
  get 'home/index'
  
  namespace :admin do
    resources :category, :except => [:show, :destroy]
      get '/category/delete/:id', to: 'category#destroy', as: 'category_destroy'
    resources :unit, :except => [:show, :destroy]
      get '/unit/delete/:id', to: 'unit#destroy', as: 'unit_destroy'
    resources :product, :except => [:show, :destroy]
      get '/product/delete/:id', to: 'product#destroy', as: 'product_destroy'
      post '/product/pesen', to: 'product#pesen', as: 'product_pesen'
      post '/product/order', to: 'product#order', as: 'product_order'
    resources :cart, :except => [:show, :destroy]
      get '/cart/delete/:id', to: 'cart#destroy', as: 'cart_destroy'

    # custom
    get '/order/payment', to: 'order#payment', as: 'order_payment'
    post '/order/proses', to: 'order#proses', as: 'order_proses'
  end

end
