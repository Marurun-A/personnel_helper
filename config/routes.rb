Rails.application.routes.draw do
  # devise_for :companies
  # devise_for :staffs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :staffs, skip: [:passwords], controllers: {
  registrations: "staff/registrations",
  sessions: 'staff/sessions'
  }


  devise_for :companys, skip: [:passwords], controllers: {
  registrations: "company/registrations",
  sessions: "company/sessions"
  }

  root to: "staff/homes#top"

   namespace :company do
    root to: "homes#top"
    get 'homes/confirm_registration' => 'homes#confirm_registration'
    get 'homes/confirm_session' => 'homes#confirm_session'
    get 'companys/my_page' => 'companys#top'
    get 'companys/information/unsubscribe' => 'companys#unsubscribe'
    get 'companys/information/withdraw' => 'companys#withdraw'
    delete '/request_forms/destroy_all' => 'request_forms#destroy_all', as: 'destroy_all_request_forms'

    post 'emploments/confirm' => 'emploments#confirm'
    get 'emploments/complete' => 'emploments#complete'

    resources :requests, only: [:index, :show, :new, :create, :update, :edit]
    resources :companys, only: [:top, :show, :edit, :update, :unsubscribe, :withdraw]
    resources :request_forms, only: [:index, :update, :destroy, :create]
    resources :recruitment_forms, only: [:index, :update, :destroy, :create]
    resources :emploments, only: [:new, :confirm, :complete, :create, :index, :show]
  end

  scope module: :company do
    resources :companys, only: [] do
      resources :recruitments
    end
  end



  namespace :staff do

    root to: "homes#top"
    get 'staffs/my_page' => 'staffs#top'

    get 'staffs/information/unsubscribe' => 'staffs#unsubscribe'
    get 'staffs/information/withdraw' => 'staffs#withdraw'
    delete '/request_forms/destroy_all' => 'request_forms/s#destroy_all', as: 'destroy_all_request_forms'

    post 'emploments/confirm' => 'emploments#confirm'
    get 'emploments/complete' => 'emploments#complete'


    resources :recruitments, only: [:index, :show, :new, :create, :update, :edit]
    resources :staffs, only: [:top, :show, :edit, :update, :unsubscribe, :withdraw]
    resources :request_forms, only: [:index, :update, :destroy, :create]
    resources :recruitment_forms, only: [:index, :update, :destroy, :create]
    resources :works, only: [:new, :confirm, :complete, :create, :index, :show]
  end


  scope module: :staff do
      resources :staffs, only: [] do
        resources :requests
    end
  end

end
