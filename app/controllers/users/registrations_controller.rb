class Users::RegistrationsController < Devise::RegistrationsController

def build_resource(hash={})
    hash[:uid] = User.create_unique_string
    super
  end
  
  def destroy
    now = Time.zone.now
    @user = current_user
    @creates_events = @user.events
    @entries_events = @user.entry_events
      if @creates_events.where(':now < end_time', now: now).present?
      flash[:danger] = "公開中のイベントがある場合は退会できません。" 
    redirect_to events_path
    
    elsif @entries_events.where(':now < end_time', now: now).present?
      flash[:danger] = "参加申し込みしているイベントがある場合は退会できません。参加を取り消す必要があります。" 
      redirect_to events_path
    
    else
     @user.destroy
      flash[:danger] = "またのご利用をお待ちしています" 
      redirect_to root_path
    end
  end
end
