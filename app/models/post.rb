class Post < ApplicationRecord
  validates :title, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :memo, length: {maximum: 500}
  validate :start_end_check
  def start_end_check
    errors.add(:end_at, "は今日以降の日付で選択してください。") unless
    :start_at > :end_at 
  end
end
