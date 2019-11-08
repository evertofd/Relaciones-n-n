Rails.application.routes.draw do
  resources :projects do
    member do
      post 'add_person'
      delete 'remove_person/:person_id', to: 'projects#remove_person', as: 'remove_person'
    end
  end
  resources :people do
    member do
      post 'add_project'
      delete 'remove_project/:project_id', to: 'people#remove_project', as: 'remove_project'

    end
  end

  root to: 'people#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
