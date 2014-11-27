describe UriValidator do
  subject do
    Class.new do
      include ActiveModel::Validations
      validates_with UriValidator
      attr_accessor :real_link
    end
    it "should be valid for a valid http url" do
      subject.real_link = 'http://www.google.com'
      subject.should be_valid
    end
  end 
end