  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root("welcome#index")

  resources(:users) do
    resources(:movies) do
      resources(:viewing_parties)
    end

    get("/discover",     to: "discover#index")
  end

    # get '/movies', to: 'movies#top_rated'
    # get '/movies/search', to: 'movies#search'
  get("/register",   to: "users#new")
  post("/register",   to: "users#create")
  get("/login",   to: "users#login_form")
  post("/login",   to: "users#login_user")
end
