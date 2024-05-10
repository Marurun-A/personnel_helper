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
    post 'employments/confirm' => 'employments#confirm'
    get 'employments/new' => 'employments#new'
    # post 'employments/new' => 'employments#new'
    get 'employments/complete' => 'employments#complete'

    resources :requests, only: [:index, :show, :new, :create, :update, :edit]
    resources :companys, only: [:top, :show, :edit, :update, :unsubscribe, :withdraw]
    resources :request_forms, only: [:index, :update, :destroy, :create]
    resources :employments, only: [:confirm, :complete, :create, :index, :show]
    resources :works, only: [:index, :show, :update] do
      member do
        patch :update_status
      end
    end
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
    post 'works/confirm' => 'works#confirm'
    get 'works/new' => 'works#new'
    # post 'works/new' => 'works#new'
    get 'works/complete' => 'works#complete'
    delete '/recruitment_forms/destroy_all' => 'recruitment_forms#destroy_all', as: 'destroy_all_recruitment_forms'

    resources :recruitments, only: [:index, :show, :new, :create, :update, :edit]
    resources :staffs, only: [:top, :show, :edit, :update, :unsubscribe, :withdraw]
    resources :recruitment_forms, only: [:index, :update, :destroy, :create]
    resources :works, only: [:confirm, :complete, :create, :index, :show]
    resources :employments, only: [:index, :show, :update] do
      member do
        patch :update_status
        end
      end
  end

  scope module: :staff do
      resources :staffs, only: [] do
        resources :requests
    end
  end

  devise_scope :company do
    post "company/guest_sign_in", to: "company/sessions#guest_sign_in"
  end

end
