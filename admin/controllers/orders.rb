Admin.controllers :orders do

  get :index do
    @orders = Order.all
    render 'orders/index'
  end

  get :new do
    @order = Order.new
    render 'orders/new'
  end

  post :create do
    @order = Order.new(params[:order])
    if @order.save
      flash[:notice] = 'Order was successfully created.'
      redirect url(:orders, :edit, :id => @order.id)
    else
      render 'orders/new'
    end
  end

  get :edit, :with => :id do
    @order = Order.find(params[:id])
    render 'orders/edit'
  end

  put :update, :with => :id do
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      flash[:notice] = 'Order was successfully updated.'
      redirect url(:orders, :edit, :id => @order.id)
    else
      render 'orders/edit'
    end
  end

  delete :destroy, :with => :id do
    order = Order.find(params[:id])
    if order.destroy
      flash[:notice] = 'Order was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Order!'
    end
    redirect url(:orders, :index)
  end
end