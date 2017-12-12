# frozen_string_literal: true

# This is a model for posts
class Picture < ApplicationRecord
  belongs_to :post

  has_attached_file :image,
                    path: ':rails_root/public/images/:id/:filename',
                    url: '/images/:id/:filename'

  do_not_validate_attachment_file_type :image
end
