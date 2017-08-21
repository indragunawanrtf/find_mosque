namespace :api, path: '/', defaults: { format: :json }, constraints: { subdomain: 'api' } do

  scope module: :v1, path: 'v1' do
	end

end