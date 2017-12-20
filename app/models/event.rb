class Event < ApplicationRecord
  mount_uploader :image, ImageUploader

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
