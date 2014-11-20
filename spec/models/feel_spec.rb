require 'rails_helper'

describe Feel do
  it { should belong_to(:user) }
  it { should validate_presence_of(:body) }
end
