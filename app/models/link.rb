class Link < ApplicationRecord
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
end
