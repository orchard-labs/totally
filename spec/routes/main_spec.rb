require 'spec_helper'

describe TotallyOrchard::Main do
  describe "GET '/'" do
    it 'returns a 200' do
      get '/'
      last_response.status.should == 200
    end

    it 'serves bootstrap' do
      get '/'
      last_response.body.should match(/bootstrap/)
    end

    it 'serves jquery' do
      get '/'
      last_response.body.should match(/jquery/)
    end

    it 'serves the orchard image' do
      get '/'
      last_response.body.should match(%r{src='/images/lib/orchard})
    end
  end
end
