# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'time'
class Cat < ApplicationRecord
  COLORS = ['orange', 'yellow', 'black', 'white', 'grey', "tiger", 'racoon', 'calico']
  SEXES = ['M', 'F']
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: {in: COLORS}
  validates :sex, inclusion: {in: SEXES}
  validate :valiDATE?

  def valiDATE?
    self.birth_date.is_a?(Date)
  end

  def age
    (((Date.today) - (self.birth_date))/365).to_i
  end

end
