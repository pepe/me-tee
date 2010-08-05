require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "OrderingController" do
  before(:all) do
    #TODO mock it
    Icon.destroy_all
    @hobby_icon = Icon.create(:type => 'hobby', :name => 'swim', :filename => 'swim.gif')
    @face_icon = Icon.create(:type => 'face', :name => 'angry', :filename => 'angry.gif')
    @job_icon = Icon.create(:type => 'job', :name => 'cook', :filename => 'cook.gif')
  end
  it 'returns to home when not all three pictures choosen' do
    post '/order'
    last_response.should be_redirect
    last_response.location.should == '/'
    session['message'].should_not be_nil
  end
  it 'renders contact form when pictures choosen' do
    get '/icons/face-angry'
    get '/icons/hobby-swim'
    get '/icons/job-cook'
    post '/order', :size => 'M'
    session['size'].should == 'M'
    last_response.should be_ok
  end
  it 'shows checkout' do
    get '/icons/face-angry'
    get '/icons/hobby-swim'
    get '/icons/job-cook'
    post '/order', :size => 'M'
    post '/checkout',
      'name' => 'x',
      'street' => 'a',
      'city' => 'b',
      'email' => 'e@co.cz',
      'phone' => 'p'
    last_response.should be_ok
    session['order']['name'].should == 'x'
    session['order']['street'].should == 'a'
    session['order']['city'].should == 'b'
    session['order']['email'].should == 'e@co.cz'
    session['order']['phone'].should == 'p'
  end
  it 'confirms order' do
    get '/icons/face-angry'
    get '/icons/hobby-swim'
    get '/icons/job-cook'
    post '/order', :size => 'M'
    post '/checkout',
      'name' => 'x',
      'street' => 'a',
      'city' => 'b',
      'email' => 'e@co.cz',
      'phone' => 'p'
    get '/confirm'
    last_response.should be_ok
    session['order'].should be_nil
    session['jobs'].should be_nil
  end
  it 'prints out order info' do
    order = Order.create(
      'name' => 'x',
      'street' => 'a',
      'city' => 'b',
      'email' => 'e@co.cz',
      'phone' => 'p',
      'hobby' => 'hobby-swim',
      'face' => 'face-angry',
      'job' => 'job-cook',
      'gender' => 'male',
      'size' => 'L')
    get "/printout/#{order.id}"
    last_response.should be_ok
  end
end
