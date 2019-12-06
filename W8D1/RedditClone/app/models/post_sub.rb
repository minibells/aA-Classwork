# == Schema Information
#
# Table name: post_subs
#
#  post_id :bigint           not null
#  sub_id  :bigint           not null
#

class PostSub < ApplicationRecord
  belongs_to :post,
    foreign_key: :post_id,
    class_name: :Post

  belongs_to :sub,
    foreign_key: :sub_id,
    class_name: :Sub
end
