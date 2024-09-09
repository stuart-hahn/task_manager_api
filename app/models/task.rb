class Task < ApplicationRecord
  belongs_to :user
  belongs_to :team

  validates :title, presence: true
  validates :status, inclusion: { in: [ "To-Do", "In Progress", "Done" ] }
  validates :due_date, presence: true
end
