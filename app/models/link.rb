class Link < ActiveRecord::Base
  attr_accessor :bitly_link
  
  validates :real_link, presence: true
  after_save :create_bitly_link

  def self.find_real_link(bitly_link)
    self.find(Converter.new.find_id_real_link(bitly_link))
  end

  def create_bitly_link
    self.bitly_link = Converter.new.to_bitly_link(self.id)
  end
end