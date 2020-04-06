Knock::Engine.routes.draw do
  post '/api/v1/user_jwt_tokens' => 'user_jwt_tokens#create'
  post '/api/v1/user_jwt_web_tokens' => 'user_jwt_tokens#create_jwt_web_token'
end
