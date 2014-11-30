require 'spec_helper'

RSpec.describe Link do
  
  describe "fields" do 
    it { should respond_to(:real_link) } 
    it { should respond_to(:bitly_link) }
  end

  describe "validations" do 
    it { should validate_presence_of(:real_link) }
    it { should validate_url_of(:real_link) }
  end
end