require 'pact/provider/rspec'

require_relative '../../quote.rb'

Pact.provider_states_for 'Client Gem' do
  provider_state 'the quote content is valid' do
    no_op
  end

  provider_state 'the quote content is invalid' do
    set_up { allow_any_instance_of(Quote).to receive(:valid?).and_return(false) }
  end
end
