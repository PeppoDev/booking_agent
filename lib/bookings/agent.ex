defmodule Flightex.Bookings.Agent do
  use Agent

  alias Flightex.Bookings.Booking

  def start_link(initial_state) do
    Agent.start_link(fn -> initial_state end, name: __MODULE__)
  end

  def save(%Booking{id: id} = booking) do
    Agent.update(__MODULE__, &update_state(&1, booking))
    {:ok, id}
  end

  def get(id), do: Agent.get(__MODULE__, &get_by_id(&1, id))

  defp update_state(state, %Booking{id: id} = booking), do: Map.put(state, id, booking)

  defp get_by_id(state, id) do
    case Map.get(state, id) do
      nil -> {:error, "Booking not found"}
      booking -> {:ok, booking}
    end
  end
end
