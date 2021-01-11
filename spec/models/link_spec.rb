require 'rails_helper'

RSpec.describe Link do
  describe 'validations' do
    it { expect(subject).to validate_presence_of(:title) }
    it { expect(subject).to validate_presence_of(:url) }
  end

  describe '.hottest_first' do
    it "returns the links: hottest to coldest" do
      coldest_link = create(:link, upvotes: 3, downvotes: 3)
      hottest_link = create(:link, upvotes: 5, downvotes: 1)
      lukewarm_link = create(:link, upvotes: 2, downvotes: 1)

      expect(Link.hottest_first).to eq [hottest_link, lukewarm_link, coldest_link]
    end
  end

  describe '#upvote' do
    it 'increments upvotes' do
      link = build(:link, upvotes: 3)

      link.upvote

      expect(link.upvotes).to eq(4)
    end
  end

  describe '#downvote' do
    it 'increments downvotes' do
      link = build(:link, downvotes: 5)

      link.downvote

      expect(link.downvotes).to eq(6)
    end
  end

  describe '#score' do
    it 'returns the upvotes minus the downvotes' do
      link = Link.new(upvotes: 2, downvotes: 3)

      expect(link.score).to eq(-1)
    end
  end
end
