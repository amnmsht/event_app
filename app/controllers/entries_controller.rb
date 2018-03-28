class EntriesController < ApplicationController
  
  def create
    entry = current_user.entries.build do |t|
      t.event_id = params[:event_id]
      t.comment = params[:entry][:comment]
    end
    if entry.save
      EntryMailer.entry_mail(entry).deliver
      flash[:notice] = "このイベントに申し込みました"
      head 201
    else
      #render json: { messages: entry.errors.full_messages }, status: 422
      flash[:danger] = "コメントは30文字以内で入力してください"
    end
  end
  
  def destroy
    @entry = current_user && current_user.entries.find_by(event_id: params[:id])
    @entry.destroy
    redirect_to event_path(params[:id]), notice: 'このイベントの参加をキャンセルしました'
  end
end
