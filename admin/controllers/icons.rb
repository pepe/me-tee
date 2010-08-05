Admin.controllers :icons do

  get :index do
    @icons = Icon.all
    render 'icons/index'
  end

  get :new do
    @icon = Icon.new
    render 'icons/new'
  end

  post :create do
    @icon = Icon.new(params[:icon])
    if @icon.save
      flash[:notice] = 'Icon was successfully created.'
      redirect url(:icons, :edit, :id => @icon.id)
    else
      render 'icons/new'
    end
  end

  get :edit, :with => :id do
    @icon = Icon.find(params[:id])
    render 'icons/edit'
  end

  put :update, :with => :id do
    @icon = Icon.find(params[:id])
    if @icon.update_attributes(params[:icon])
      flash[:notice] = 'Icon was successfully updated.'
      redirect url(:icons, :edit, :id => @icon.id)
    else
      render 'icons/edit'
    end
  end

  delete :destroy, :with => :id do
    icon = Icon.find(params[:id])
    if icon.destroy
      flash[:notice] = 'Icon was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Icon!'
    end
    redirect url(:icons, :index)
  end
end