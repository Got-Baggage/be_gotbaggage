# frozen_string_literal: true

module Mutations
  class TripDelete < BaseMutation
    description "Deletes a trip by ID"

    field :trip, Types::TripType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      trip = ::Trip.find(id)
      raise GraphQL::ExecutionError.new "Error deleting trip", extensions: trip.errors.to_hash unless trip.destroy

      { trip: trip }
    end
  end
end
