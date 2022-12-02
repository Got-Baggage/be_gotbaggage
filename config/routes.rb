Rails.application.routes.draw do

  # *** for testing in graphiQL ***
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"

  # *** for production/postman *** 
  # get "/graphql", to: "graphql#execute"
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html