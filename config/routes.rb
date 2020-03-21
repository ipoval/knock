Knock::Engine.routes.draw do
  post '/api/v1/user_jwt_tokens' => 'user_jwt_tokens#create'
end
