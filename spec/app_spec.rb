# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

RSpec.describe 'Quote of the Day API' do
  describe 'ping' do
    it 'should respond with pong' do
      get '/ping'
      expect(last_response).to be_ok
    end
  end
end
