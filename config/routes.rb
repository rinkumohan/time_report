Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
    
  resources :projects
  resources :tasks
  
  get 'timesheet_report' => 'tasks#timesheet_report', as: 'timesheet_report'
  
end
