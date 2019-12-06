# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :status, presence: true
  validates :cat_id, presence: true, uniqueness: true

  belongs_to :cat,
  foreign_key: :cat_id,
  class_name: :Cat

  def overlapping_requests(other_cat_id)
    cat = CatRentalRequest.where('? BETWEEN start_date AND end_date', other_cat_id.start_date).or(CatRentalRequest.where('? BETWEEN start_date AND end_date', other_cat_id.end_date))
  end

  def does_not_overlap_approved_request(other_cat_id)
    overlapping_requests(other_cat_id).exists?
  end


end
