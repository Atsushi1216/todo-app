Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #rootをtasks_indexへ変更
   root to: 'homes#top'
  #resoucesでアクションをルーティングに追加
  resources :tasks
end
