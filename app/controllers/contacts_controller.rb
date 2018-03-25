class ContactsController < ApplicationController
    def new
      @contact = Contact.new
  end
  
    def create
      @contact = Contact.new(contact_params)
      if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      flash[:success] = "問い合わせ送信しました!"
      redirect_to root_path
    else
      render'new'
  end
end
  
    private
    def contact_params
    params.require(:contact).permit(:name, :email, :content)  
end
end
