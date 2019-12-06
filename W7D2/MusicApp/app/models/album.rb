# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  year       :date             not null
#  studio     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  band_name  :string           not null
#

class Album < ApplicationRecord
    belongs_to :band,
    foreign_key: :band_name,
    class_name: :Band
end
