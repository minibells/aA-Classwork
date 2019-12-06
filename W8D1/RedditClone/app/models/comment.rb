# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  user_id    :integer          not null
#  post_id    :integer          not null
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord

  belongs_to :post,
  foreign_key: :post_id,
  class_name: :Post

  belongs_to :parent_comment,
  foreign_key: :parent_id,
  class_name: :Comment,
  optional: true

  has_many :child_comments,
  foreign_key: :parent_id,
  class_name: :Comment
end
