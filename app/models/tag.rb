class Tag < ActiveRecord::Base

  has_and_belongs_to_many :posts

  def to_param # overidden
    name # for 'happy urls which use tag /name/, not default; /id/'
  end

  def to_s
    "##{name}"
  end

end # of class
