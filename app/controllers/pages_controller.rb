class PagesController < ApplicationController
  def home
    @page = 'home'
  end

  def about
    @page = 'about'
  end

  def program
    @page = 'program'
  end
  
  def join
    @application_sent = false
    @page = 'join'
    @application = Application.new
  end

  def contact
    @message_sent = false
    @page = 'contact'
    @message = Message.new
  end
  
  def send_application_form
    @application = Application.new(params[:application])
    if @application.deliver
      @application_sent = true
      render :join
    else
      flash.now[:error] = 'Cannot send message.'
      render :join
    end
  end
  
  def send_message_form
    @message = Message.new(params[:message])
    if @message.deliver
      @message_sent = true
      render :contact
    else
      flash.now[:error] = 'Cannot send message.'
      render :contact
    end
  end
  
  
  private
  def check_page page
    if @page == page
      return 'selected'
    else
      return ''
    end
  end
  
  helper_method :check_page
  
end
