# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Cat < ActiveRecord::Base
  COLORS = %w(grey black white orange calico)
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: COLORS,
    message: "%{value} is not a valid color"}
  validates :sex, inclusion: { in: %w(M F),
    message: "%{value} must be M or F"}


  def age
    now = Time.now.utc.to_date
    now.year - self[:birth_date].year - ((now.month > self[:birth_date].month || (now.month == self[:birth_date].month && now.day >= self[:birth_date].day)) ? 0 : 1)
  end
end
