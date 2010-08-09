require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "Order Model" do
  it 'cannot be saved empty' do
    Order.new.should_not be_valid
  end
  it 'validates presence of fields' do
    Order.new(
      'fullname' => 'x',
      'street' => 'a',
      'city' => 'b',
      'email' => 'e@co.cz',
      'phone' => 'p',
      'hobby' => 'hobby-swim',
      'face' => 'face-angry',
      'job' => 'job-cook',
      'gender' => 'male',
      'size' => 'L').should be_valid   
  end
end
