class Post < ActiveRecord::Base
  # specify style with maximum size (does not change aspect ratio)
  has_attached_file :image, styles: { medium: "300x300>" }
end
