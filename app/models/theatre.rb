class Theatre < ActiveRecord::Base
  validates :number, uniqueness:   true,
                     numericality: { only_integer: true },
                     presence:     true

  validates :capacity, numericality: { only_integer: true },
                       presence:     true
end
