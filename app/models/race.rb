class Race < ApplicationRecord
  has_many :checkpoints, -> { order(position: :asc) }

  accepts_nested_attributes_for :checkpoints, reject_if: :all_blank, allow_destroy: true

  def starting_line
    checkpoints.first
  end

  def finish_line
    checkpoints.last
  end
end
