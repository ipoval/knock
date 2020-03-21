Knock::Engine.routes.draw do
  post '/api/v1/auth_jwt_tokens' => 'auth_jwt_tokens#create'
end
