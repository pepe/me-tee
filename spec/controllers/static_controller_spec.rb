require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "StaticController" do
  it 'renders how to buy page' do
    get '/how-to-buy'
    last_response.should be_ok
  end
  it 'renders bussiness conditions page' do
    get '/business-conditions'
    last_response.should be_ok
  end
  it 'renders privacy page' do
    get '/privacy'
    last_response.should be_ok
  end
  it 'renders contact page' do
    get '/contact'
    last_response.should be_ok
  end
  it 'renders transport payment page' do
    get '/transport-payment'
    last_response.should be_ok
  end
  it 'renders screen css rules' do
    get '/stylesheets/screen.css'
    last_response.should be_ok
  end
  it 'changes locale to english' do
    get '/locale/en'
    last_response.should be_redirect
    session[:locale].should == 'en'
    I18n.locale.should == :en
  end
  it 'changes locale to czech' do
    get '/locale/cz'
    last_response.should be_redirect
    session[:locale].should == 'cz'
    I18n.locale.should == :cz
  end
  it 'renders validation javascript' do
    get '/javascripts/validate_required.js'
    last_response.should be_ok
  end
end
