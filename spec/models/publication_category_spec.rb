require 'rails_helper'

RSpec.describe PublicationCategory, type: :model do
  it { should have_many(:publications) }
end
