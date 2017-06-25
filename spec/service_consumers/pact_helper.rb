require 'pact/provider/rspec'
require_relative './provider_states'

ENV['RACK_ENV'] = 'test'

Pact.service_provider "Quote of the Day Service" do
  honours_pact_with 'Gem Client' do

    # This example points to a local file, however, on a real project with a continuous
    # integration box, you would use a [Pact Broker](https://github.com/bethesque/pact_broker) or publish your pacts as artifacts,
    # and point the pact_uri to the pact published by the last successful build.

    pact_uri '../quote_of_the_day-client/spec/pacts/client_gem-quote_of_the_day_service.json'
  end
end
