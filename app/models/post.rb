class Post < ActiveRecord::Base

  validates :title, :description, presence: true

  default_scope { select('id,title,description,clicks') }

  def self.promoted_posts
    where('promote=1 and clicks>0')
  end

  def self.normal_posts
    where('promote=0 or clicks<1')
  end
  
end