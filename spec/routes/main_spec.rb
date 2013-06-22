require 'spec_helper'

describe TotallyOrchard::Main do
  describe "GET '/'" do
    it 'returns a 200' do
      get '/'
      last_response.status.should == 200
    end
  end
end
