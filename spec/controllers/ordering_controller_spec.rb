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
    last_response.should be_ok
    session['size'].should == 'M'
  end
end
