class Event < ApplicationRecord
  belongs_to :lesson
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances
  has_many :students, through: :attendances

  def format_body
    {
      'text' => "#{self.name} from #{self.start} to #{self.end}"
    }
  end

  def start_time
    Chronic.parse(self.start).strftime('%H:%M, %B %e, %Y')
  end

  def end_time
    Chronic.parse(self.end).strftime('%H:%M, %B %e, %Y')
  end
end
