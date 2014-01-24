class Post < ActiveRecord::Base

  after_create :send_new_post_email

  validates :price, numericality: { greater_than: 0, less_than: 999999 }

  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments

  has_attached_file :image,
                    styles: { medium: "300x300>" }, # does not change aspect ratio
                    storage: :s3,
                    s3_credentials: {
                      # following need to be set locally and in Heroku with heroku config:set...
                      access_key_id: ENV['S3_ACCESS_KEY'],
                      secret_access_key: ENV['S3_SECRET_KEY']
                    },
                    bucket: 'instagram_clone_aws'

  def self.for_tag_or_all(tag_name)
    if tag_name
      # find all posts linked to the given tag
      @posts = Tag.find_by(name: tag_name).posts
    else
      @posts = Post.all
    end
  end

  def tag_names
    tags.map { |tag| tag.name }.join(' ')
  end

  def tag_names=(tag_names)
    self.tags = tag_names.split(/,\s?/).map do |tag_name|
      Tag.find_or_create_by(name: tag_name)
    end
  end

  def send_new_post_email
    PostMailer.new_post(self, self.user).deliver!
  end


end # of class
