class Link < ApplicationRecord
  validates_presence_of :lookup_code, :original_url
  validates_uniqueness_of :lookup_code
  validate :original_url_format

  def original_url_format
    uri = URI.parse(original_url || '')
    unless uri.host
      errors.add(:original_url, 'Invalid URL format')
    end
  end
end
