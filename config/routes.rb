Rails.application.routes.draw do
  # devise_for :instructor_users
  devise_for :instructor_users, controllers: {
  sessions:      'instructor_users/sessions',
  passwords:     'instructor_users/passwords',
  registrations: 'instructor_users/registrations'
}
  # devise_for :admins
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  # devise_for :users
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
