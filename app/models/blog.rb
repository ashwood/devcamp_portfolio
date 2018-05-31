class Blog < ApplicationRecord
  belongs_to :topic
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title, :body, :topic

  has_many :comments, dependent: :destroy

  def self.by_most_recent
    order("created_at DESC")
  end

  def self.published
    where(status: "published")
  end

  scope :draft_status, -> { where(status: 'draft') }
end
