require 'rack/contrib'
require 'sinatra'
require 'sinatra/json'
require 'byebug'

require './quote'

use Rack::PostBodyContentTypeParser
set(:show_exceptions, false) if %w[test production].include?(ENV['RACK_ENV'])

get '/ping' do
  'pong'
end

get '/quote' do
  json(quote: { content: 'Some quote here' })
end

post '/quote' do
  content_type :json
  quote = Quote.new(params['quote']['content'])

  if quote.save
    [201, { quote: quote.to_json }.to_json]
  else
    [422, { error: { type: 'ContentError', message: 'Invalid content' } }.to_json]
  end
end
