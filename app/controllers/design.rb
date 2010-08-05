PadMeTee.controllers :design do
  configure do
    Compass.configuration do |config|
      config.project_path = File.dirname(__FILE__)
      config.sass_dir = File.join 'views', 'stylesheets'
    end

    set :haml, { :format => :html5 }
    set :sass, Compass.sass_engine_options
  end

  before do
    session['gender'] ||= 'male'
    session['order'] ||= {}
  end
  
  get :index, :map => '/' do
    #TODO redone messaging with flash
    @message = session.delete('message')
    render 'design/index'
  end

  get :female, :map => '/female' do
    session['gender'] = 'female'
    @message = I18n.t('tshirt.chosen_gender') % I18n.t('gender.female')
    render 'design/index'
  end

  get :male, :map => '/male' do
    session['gender'] = 'male'
    @message = I18n.t('tshirt.chosen_gender') % I18n.t('gender.male')
    render 'design/index'
  end

  get :icons, :map => '/icons/:id' do
    @icon = Icon.find(params[:id])
    session[@icon.type] = @icon.id
    if request.xhr?
      status 204
    else
      render 'design/index'
    end
  end
  
  get :save, :map => '/save' do
    @design = Design.new
    @design.hobby = session['hobby']
    @design.face = session['face']
    @design.job = session['job']
    @design.save
    session['message'] = I18n.t('app.design_stored') % [@design.id]
    redirect "/design/%s" % @design.id
  end

  get :design, :map => '/design/:id' do
    @design = Design.find(params[:id])
    @message = session.delete('message') || I18n.t('app.design_restored')
    session['hobby'] = @design.hobby
    session['face'] = @design.face
    session['job'] = @design.job
    render 'design/index'
  end

  get :random, :map => '/random' do
    session['hobby'] = Icon.random('hobby')
    session['face'] = Icon.random('face')
    session['job'] = Icon.random('job')
    render "design/index"
  end
end
