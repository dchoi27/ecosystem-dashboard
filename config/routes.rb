Rails.application.routes.draw do

  mount PgHero::Engine, at: "pghero"

  resources :packages do
    collection do
      get :search
      get :outdated
    end
  end
  resources :repositories

  get 'collabs/repositories', to: 'repositories#collab_repositories', as: :collab_repositories
  get 'collabs/events', to: 'repositories#collab_events', as: :collab_events
  get 'events', to: 'repositories#events'
  get 'slow_response', to: 'issues#slow_response'
  get 'weekly', to: 'issues#weekly'
  get 'collabs', to: 'issues#collabs'
  get 'all', to: 'issues#all'
  get 'orgs/:id/dependencies', to: 'orgs#dependencies', as: :org_dependencies
  get 'orgs/:id/events', to: 'orgs#events', as: :org_events
  get 'orgs/:id', to: 'orgs#show', as: :org
  get 'orgs', to: 'orgs#internal'
  get 'home', to: 'home#index'

  root to: 'issues#index'
end
