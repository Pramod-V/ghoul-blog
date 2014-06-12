class Post
  ## In order to render forms Rails expect that there is an association with Active Record or Active Model so :
  ## We have to extend and need to implement persisted method

  extend ActiveModel::Naming
  include ActiveModel::Conversion

  ## To get the validataion to be true we need the following
  include ActiveModel::Validations
  validates :title, presence: true

  attr_accessor :title,:blog,:body,:pubdate
  
  def initialize(args = {})
    args.each{ |k,v| send("#{k}=",v) } 
  end

  def publish(clock = DateTime)
    return false unless valid?
    self.pubdate = clock.now
    blog.add_entry(self) 
  end

  def persisted?
    false
  end
end
