Rails.application.routes.draw do
  get 'items/show'
 root to: 'items#show'
end
