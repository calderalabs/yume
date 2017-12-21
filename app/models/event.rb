class Event < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  def as_json(_options = {})
    {
      id: id,
      title: title,
      location: location,
      description: description,
      image: image.url,
      starts_at: starts_at.utc.iso8601,
      ends_at: starts_at.utc.iso8601
    }
  end
end
