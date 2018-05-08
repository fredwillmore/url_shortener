
class Url < ApplicationRecord

  validates :full, format: { 
    with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix,
    message: "valid URL required" 
  }
  
  def short
    id.to_s self.class.radix
  end
  
  def self.find_by_short short
    find to_id short
  end
  
  private 
  
  def self.radix
    36
  end
  
  def self.to_id short
    short.to_i radix
  end
end
