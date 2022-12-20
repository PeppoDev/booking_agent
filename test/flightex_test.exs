defmodule FlightexTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Users.Agent, as: UserAgent

  describe "start_agents/0" do
    test "should create a user when all given params are valid" do
      Flightex.start_agents()

      response =
        :users
        |> build()
        |> Flightex.create_or_update_user()

      expected_resposne = {:ok, "User created with successfully"}
      assert response == expected_resposne
    end

    test "should not create nor update a user when cpf is not valid" do
      Flightex.start_agents()

      response =
        :users
        |> build(cpf: 000_000_000_00)
        |> Flightex.create_or_update_user()

      expected_resposne = {:error, "Cpf must be a String"}
      assert response == expected_resposne
    end
  end
end
