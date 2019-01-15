# frozen_string_literal: true

module Serializable
  def serialize
    ActiveModelSerializers::SerializableResource.new(self).as_json.to_json
  end
end
