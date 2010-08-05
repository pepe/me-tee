PadMeTee.controllers :static do
  layout :popup

  get :how_to_buy, :map => '/how-to-buy' do
    render 'static/how_to_buy'
  end

  get :business_conditions, :map => '/business-conditions' do
    render 'static/business_conditions'
  end

  get :privacy, :map => '/privacy' do
    render 'static/privacy'
  end

  get :contact, :map => '/contact' do
    render 'static/contact'
  end

  get :transport_payment, :map => '/transport-payment' do
    render 'static/transport_payment'
  end

  get :stylesheets, :map => '/stylesheets/:name.css' do
    content_type 'text/css', :charset => 'utf-8'
    sass(:"stylesheets/#{params[:name]}", Compass.sass_engine_options )
  end

  #TODO should it be here or some other place?
  get :locale, :map => '/locale/:locale' do
    session[:locale] = params[:locale]
    I18n.locale = session[:locale]
    redirect '/'
  end

  get :validate_js, :map => '/javascripts/validate_required.js' do
    render 'javascripts/validate_required'
  end

end
