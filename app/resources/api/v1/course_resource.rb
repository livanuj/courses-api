module Api
  module V1
    class CourseResource < JSONAPI::Resource
      attributes :name, :self_assignable
      has_one :coach
      has_many :activities

      filter :self_assignable

      # JSONAPI.configure do |config|
      #   # built in key format options are :underscored_key, :camelized_key and :dasherized_key
      #   config.json_key_format = :underscored_key
      # end
    end
  end
end
