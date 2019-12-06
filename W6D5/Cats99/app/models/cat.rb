# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'

class Cat < ApplicationRecord
  
  include ActionView::Helpers::DateHelper

  COLORS = ["Calico", "Tabby", "Ginger", "White", "Black"]
  
# silly = Cat.new( {birth_date: "August 7 2006", color: "White", name: "Silly", sex: "F"}) 
  validates :sex, inclusion: { in: ["M", "F"] }
  validates :birth_date, :name, presence: true
  validates :color, inclusion: { in: COLORS }

  has_many :rentals,
  foreign_key: :cat_id,
  class_name: :CatRentalRequest,
  dependent: :destroy

  def age
    today = Time.now
    bday = self.birth_date
    from_time = (bday)
    time_ago_in_words(from_time)
  end

 
    
  
end
