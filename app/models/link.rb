class Link < ActiveRecord::Base
  attr_accessor :bitly_link

  validates :real_link, :url => {:message => "Bad URL format"}
  validates_presence_of :real_link, :message => "Can't be empty"

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