class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
    
  def top
  end
    
  PER = 5
  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true)
    respond_to do |format|
      format.html { @events = @events.page(params[:page]).per(PER).where('start_time > ?',Time.zone.now).order(:start_time) }
    end
  end
    
  def new
    @event = Event.new
  end
    
  def create
    @event= Event.new(event_params)
    @event.user_id = current_user.id 
    if @event.save
      flash[:success] = 'イベントを作成しました！'
      redirect_to @event
    else
      render :new
    end
  end

  def show
    @favorite = current_user.favorites.find_by(event_id: @event.id)
    @entry = current_user && current_user.entries.find_by(event_id: params[:id])
    @entries = @event.entries.includes(:user).order(:created_at)
  end
    
  def edit
  end
    
  def update
    if @event.update(event_params)
      flash[:success] = "更新しました！"
      redirect_to @event
    else
      render :edit
    end
  end
  
  def destroy
    if @event.entries.present?
      flash[:danger] = "参加申し込み者のいるイベントは削除できません" 
      redirect_to events_path
    else
      @event.destroy
      flash[:success] = "イベントを削除しました！"
      redirect_to events_path
    end
  end
    
  private
    
  def event_params
    params.require(:event).permit(:title, :place, :image, :image_cache, :start_time, :end_time, :content)
  end
  
  def set_event
    @event = Event.find(params[:id])
  end
end