class Api::V1::ActivityResource < JSONAPI::Resource
  attributes :name
  has_one :course
end