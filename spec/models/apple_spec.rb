require 'spec_helper'

describe Apple do
  let(:apple) { Apple.create! }

  it 'sets created_at' do
    apple.created_at.should_not be_nil
  end

  it 'sets updated_at' do
    apple.updated_at.should_not be_nil
  end

  it 'updates updated_at' do
    u1 = apple.updated_at
    apple.title = 'hello world'
    sleep 0.5
    apple.save
    u2 = apple.updated_at

    u2.should_not == u1
  end
end
