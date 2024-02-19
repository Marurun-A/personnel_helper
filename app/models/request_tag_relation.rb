class RequestTagRelation < ApplicationRecord
  belongs_to :request
  belongs_to :tag
end
