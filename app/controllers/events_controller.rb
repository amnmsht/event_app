class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
    
    def top
    end
    
    def index
        @events = Event.where('start_time > ?',Time.zone.now).order(:start_time)
    end
    
    def new
        @event = Event.new
    end
    
    def create
      @event= Event.new(event_params)
      if @event.save
        flash[:success] = 'イベントを作成しました！'
        redirect_to new_event_path
        else
          render 'new'
        end
      end
    
    def show
        #@event = Event.find(params[:id])
    end
    
    def edit
      #@event = Event.find(params[:id])
    end
    
    def update
      #@event = Event.find(params[:id])
      if @event.update(event_params)
        flash[:success] = "更新しました！"
        redirect_to @event
      else
        render 'edit'
      end
    end
  
    def destroy
      #@event = Event.find(params[:id])
      @event.destroy
      flash[:success] = "削除しました！"
      redirect_to events_path
    end

    
    private
    def event_params
      params.require(:event).permit(:title,:content,:place,:start_time,:end_time)  
  end
  
  def set_event
      @event = Event.find(params[:id])
    end
  end

