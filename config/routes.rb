Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1, defaults: {format: 'json'} do
    resources :job_opportunities, path: '/vagas', only: [:create] do
      get 'candidaturas/ranking' => 'job_applications#ranking'
    end
    resources :people, path: '/pessoas', only: [:create]
    resources :job_applications, path: '/candidaturas', only: [:create]
  end
end
