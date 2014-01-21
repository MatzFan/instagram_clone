class Post < ActiveRecord::Base
  # specify style with maximum size (does not change aspect ratio)
  belongs_to :user
  has_and_belongs_to_many :tags

  has_attached_file :image,
                    styles: { medium: "300x300>" },
                    storage: :s3,
                    s3_credentials: {
                      # following need to be set locally and in Heroku with heroku config:set...
                      access_key_id: ENV['S3_ACCESS_KEY'],
                      secret_access_key: ENV['S3_SECRET_KEY']
                    },
                    bucket: 'instagram_clone_aws'

  def tag_names
    tags.map { |tag| tag.name }.join(' ')
  end

  def tag_names=(tag_names)
    self.tags = tag_names.split(' ').map do |tag_name|
      Tag.find_or_create_by(name: tag_name)
    end
  end

end # of class
