require 'rails_helper'

describe User do
  it { should have_many(:retrospectives) }
  it { should validate_presence_of(:email) }
end
