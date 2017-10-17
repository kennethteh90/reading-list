Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'readings#index'
  resources :readings do
    resources :bookmarks
    put :read, on: :member
    put :unread, on: :member
  end
  # patch '/readit/:id', to: 'readings#readit', as: :readit

end
