class Link < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :url

  def score
    upvotes - downvotes
  end

  def upvote
    increment!(:upvotes)
  end

  def downvote
    increment!(:downvotes)
  end
end
