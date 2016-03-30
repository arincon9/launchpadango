class Theatre < ActiveRecord::Base
  has_many :showtimes, dependent: :destroy, inverse_of: :theatre

  validates :number, uniqueness: true,
                     presence:   true,
                     numericality: { greater_than: 0 }

  validates :capacity, presence: true,
                       numericality: { greater_than: 0 }
end
