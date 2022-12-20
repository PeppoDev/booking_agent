defmodule Flightex.Bookings.Report do
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Booking

  def generate(filename \\ "report.csv") do
    booking_list = build_data()
    File.write(filename, booking_list)
  end

  defp build_data() do
    BookingAgent.get_all()
    |> Map.values()
    |> Enum.map(fn booking -> booking_to_string(booking) end)
  end

  defp booking_to_string(%Booking{
         user_id: user_id,
         local_origin: local_origin,
         local_destination: local_destination,
         complete_date: complete_date
       }) do
    "#{user_id},#{local_origin},#{local_destination},#{complete_date}\n"
  end
end
