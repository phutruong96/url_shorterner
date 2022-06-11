class Link < ApplicationRecord
  # Association
  belongs_to :user

  # Validation
  validates_presence_of :url
  validate :check_url
  validates_uniqueness_of :shorter_url

  before_validation :generate_shorter_url

  default_scope { order(created_at: :desc) }

  def generate_shorter_url
    self.shorter_url = SecureRandom.uuid[0..5]
  end

  def short
    Rails.application.routes.url_helpers.short_url(shorter_url: shorter_url)
  end

  def check_url
    errors.add(:url, 'is invalid') unless ValidationService.valid_url?(url)
  end
end
