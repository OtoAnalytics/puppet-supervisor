require 'spec_helper'
describe 'supervisord' do

  context 'with defaults for all parameters' do
    it { should contain_class('supervisord') }
  end
end
