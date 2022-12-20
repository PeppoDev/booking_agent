defmodule Flightex do
  alias Flightex.Bookings.CreateOrUpdate, as: BookingCOU
  alias Flightex.Users.CreateOrUpdate, as: UserCOU

  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Bookings.Agent, as: BookingAgent

  defdelegate create_or_update_booking(params), to: BookingCOU, as: :call
  defdelegate create_or_update_user(params), to: UserCOU, as: :call

  def start_agents() do
    UserAgent.start_link(%{})
    BookingAgent.start_link(%{})
  end
end
