Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '/api', defaults: {format: 'json' } do
  	scope '/v1' do
      scope '/food_scraps' do
        get '/' => 'food_scraps#index'
        post '/' => 'food_scraps#create'
      end
      scope '/electronics' do
        get '/' => 'electronics#index'
        post '/' => 'electronics#create'
       end
      scope '/textiles' do
        get '/' => 'textiles#index'
        post '/' => 'textiles#create'
      end
    end
  end

end
