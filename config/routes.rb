Rails.application.routes.draw do
  resources :users do
    resouces :calendars
  end
end
