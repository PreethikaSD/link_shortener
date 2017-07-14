Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get '/' => 'links#get_link', via: :get
    match '/' => 'links#shorten_link', via: :post, :defaults => { :format => :json }
    get '/:shortened_link', to: "links#show"

end
