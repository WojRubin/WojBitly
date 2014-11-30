class Link < ActiveRecord::Base
  attr_accessor :bitly_link

  validates :real_link, :presence => {:message => "Empty URL input"}, :url => {:message => "Bad URL format"}

  after_save :create_bitly_link

  def self.find_real_link(bitly_link)
    obj = self.find(Converter.new.find_id_real_link(bitly_link))
    return obj.real_link

  end
  
private

  def create_bitly_link
    self.bitly_link = Converter.new.to_bitly_link(self.id)
  end
end