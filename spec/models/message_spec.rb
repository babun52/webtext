require 'rails_helper'

describe Message, :vcr => true do
  it "does not save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '1111dedrf11', :from => '9718033633')
    message.save.should be false
  end

 it "adds an error if the number is invalid" do
   message = Message.new(:body => 'hi', :to => '1111dedrf11', :from => '9718033633')
   message.save
   message.errors[:base].should eq ["The 'To' number 1111dedrf11 is not a valid phone number."]
 end
end
