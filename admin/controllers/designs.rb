Admin.controllers :designs do

  get :index do
    @designs = Design.all
    render 'designs/index'
  end

  get :new do
    @design = Design.new
    render 'designs/new'
  end

  post :create do
    @design = Design.new(params[:design])
    if @design.save
      flash[:notice] = 'Design was successfully created.'
      redirect url(:designs, :edit, :id => @design.id)
    else
      render 'designs/new'
    end
  end

  get :edit, :with => :id do
    @design = Design.find(params[:id])
    render 'designs/edit'
  end

  put :update, :with => :id do
    @design = Design.find(params[:id])
    if @design.update_attributes(params[:design])
      flash[:notice] = 'Design was successfully updated.'
      redirect url(:designs, :edit, :id => @design.id)
    else
      render 'designs/edit'
    end
  end

  delete :destroy, :with => :id do
    design = Design.find(params[:id])
    if design.destroy
      flash[:notice] = 'Design was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Design!'
    end
    redirect url(:designs, :index)
  end
end