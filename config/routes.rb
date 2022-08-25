# Copyright (c) 2022 sweecm Software

Rails.application.routes.draw do
  get 'dog/index'
  post 'dog/apply', to: 'dog#apply'
  root 'dog#index'
end
