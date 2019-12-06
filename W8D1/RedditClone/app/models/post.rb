# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string           not null
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

  belongs_to :user,
  foreign_key: :user_id,
  class_name: :User

  has_many :post_subs, 
    foreign_key: :post_id,
    class_name: :PostSub,
    inverse_of: :post


  has_many :subs,
  through: :post_subs,
  source: :sub

  has_many :comments,
  foreign_key: :post_id,
  class_name: :Comment


 

end
