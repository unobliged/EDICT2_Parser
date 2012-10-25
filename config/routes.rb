Edict2Parser::Application.routes.draw do

	root :to => 'static_pages#home'

  resources :words do
		collection do
			get '/find', :as => :find
			get '/find_in_def', :as => :find_in_def
		end
	end

	match '/about',   :to => 'static_pages#about'

end
