class Theatre < ActiveRecord::Base
  has_many :showtimes, dependent: :destroy, inverse_of: :theatre
  has_many :orders, inverse_of: :theatre

  validates :number, uniqueness: true,
                     presence:   true,
                     numericality: { greater_than: 0 }

  validates :capacity, presence: true,
                       numericality: { greater_than: 0 }

  def display_name
    "Theatre: #{number} - capacity: #{capacity}"
  end
end
