require 'rails_helper'

RSpec.describe Link do
  describe 'validations' do
    it { expect(subject).to validate_presence_of(:title) }
    it { expect(subject).to validate_presence_of(:url) }
  end
end
