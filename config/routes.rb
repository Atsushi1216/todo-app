Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #rootをtasks_indexへ変更
  root to: 'tasks#index'
  #resoucesでアクションをルーティングに追加
  resources :tasks
end
