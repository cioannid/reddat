class Link < ApplicationRecord
  IMAGE_FORMATS = %w(.jpg .png .gif .jpeg)

  validates_presence_of :title
  validates_presence_of :url

  def self.hottest_first
    order(Arel.sql('upvotes - downvotes DESC'))
  end

  def upvote
    increment!(:upvotes)
  end

  def downvote
    increment!(:downvotes)
  end

  def score
    upvotes - downvotes
  end

  def image?
    url.end_with? *IMAGE_FORMATS
  end
end
