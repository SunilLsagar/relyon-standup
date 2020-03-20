class Team < ApplicationRecord
  has_many :team_member, dependent: :destroy
end
