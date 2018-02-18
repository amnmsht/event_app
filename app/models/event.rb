class Event < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    has_many :entries
    belongs_to :user, optional: true
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    validates :title, length: { maximum: 50 }, presence: true
    validates :place, length: {maximum: 100}, presence: true
    validates :content, length: {maximum: 2000 }, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    validate :start_time_should_be_before_end_time
    
    geocoded_by :place
    after_validation :geocode, if: :place_changed?
    
    private
    
    def start_time_should_be_before_end_time
        return unless  start_time && end_time
        
        if start_time >= end_time
            errors.add(:start_time, 'は終了時間より前に設定してください')
            
        end
    end
end