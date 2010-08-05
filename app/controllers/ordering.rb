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
end
