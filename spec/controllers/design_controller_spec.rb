require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "Design controller" do
  context "home page" do
    it "renders home page" do
      get '/'
      last_response.should be_ok
    end
  end
  context "gender pages" do
    it "has default gender in session" do
      get '/'
      session['gender'].should == 'male'
    end
    it "has page for change gender to female" do
      get '/female'
      session['gender'].should == 'female'
    end
    it "has page for change gender to male" do
      get '/female'
      get '/male'
      session['gender'].should == 'male'
    end
  end

  context "choosed icon state saving" do
    before(:all) do
      #TODO mock it
      Icon.destroy_all
      @hobby_icon = Icon.create(:type => 'hobby', :name => 'swim', :filename => 'swim.gif')
      @face_icon = Icon.create(:type => 'face', :name => 'angry', :filename => 'angry.gif')
      @job_icon = Icon.create(:type => 'job', :name => 'cook', :filename => 'cook.gif')
    end
    it "saves icon for hobbies" do
      get '/icons/hobby-swim'
      session['hobby'].should == @hobby_icon
    end
    it "saves icon for faces" do
      get '/icons/face-angry'
      session['face'].should == @face_icon
    end
    it "saves icon for jobs" do
      get '/icons/job-cook'
      session['job'].should == @job_icon
    end
    it "returns 204 on xhr request" do
      header 'X-Requested-With', 'XMLHttpRequest'
      get '/icons/job-cook'   
      last_response.status.should == 204
      session['job'].should == @job_icon
    end
  end

  context "design saving" do
    it "save whole design" do
      get '/save'
      last_response.should be_ok     
      Design.should_receive(:create)
    end
  end
end
