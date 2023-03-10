defmodule Flightex.Bookings.Booking do
  @keys [:complete_date, :local_origin, :local_destination, :user_id, :id]
  @enforce_keys @keys
  defstruct @keys

  def build(
        complete_date,
        local_origin,
        local_destination,
        user_id
      ) do
    {:ok,
     %__MODULE__{
       id: UUID.uuid4(),
       user_id: user_id,
       local_destination: local_destination,
       local_origin: local_origin,
       complete_date: complete_date
     }}
  end
end
