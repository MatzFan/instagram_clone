class Post < ActiveRecord::Base
  # specify style with maximum size (does not change aspect ratio)
  has_attached_file :image,
                    styles: { medium: "300x300>" },
                    storage: :s3,
                    s3_credentials: {
                      # following need to be set locally and in Heroku with heroku config:set...
                      access_key_id: ENV['S3_ACCESS_KEY'],
                      secret_access_key: ENV['S3_SECRET_KEY']
                    },
                    bucket: 'instagram_clone_aws'
end
