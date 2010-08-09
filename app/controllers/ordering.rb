PadMeTee.controllers :ordering do
  
  post :order, :map => '/order' do
    if session['hobby'] && session['face'] && session['job']
      session['size'] = params['size']
      render 'ordering/contact_form'
    else
      session['message'] = I18n.t('order.errors.all_three_required')
      redirect '/'
    end
  end

  get :order, :map => '/order' do
    render 'ordering/contact_form'
  end

  post :checkout, :map => '/checkout' do
    session['order'] = {
      'fullname' => params['fullname'],
      'street' => params['street'],
      'city' => params['city'],
      'zip' => params['zip'],
      'email' => params['email'],
      'phone' => params['phone'],
      'note' => params['note'],
      'coupon' => params['coupon'],
      'gender' => session['gender'],
      'face' => session['face'],
      'job' => session['job'],
      'hobby' => session['hobby'],
      'size' => session['size']
    }
    if Order.new(session['order']).valid?
      render 'ordering/checkout'
    else
      render 'ordering/contact_form'
    end
  end

  get :confirm, :map => '/confirm' do
    @order = Order.create(session['order'])
    @permalink = 'http://%s/printout/%s' % [host_name, @order.id]
    session['order'] = session['hobby'] = session['face'] = session['job'] = nil
    render 'ordering/confirm'
  end
  
  get :printout, :map => '/printout/:id' do
    @order = Order.find(params[:id])
    render 'ordering/printout'
  end

end
