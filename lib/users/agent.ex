defmodule Flightex.Users.Agent do
  use Agent

  alias Flightex.Users.User

  def start_link(initial_state) do
    Agent.start_link(fn -> initial_state end, name: __MODULE__)
  end

  def save(%User{} = user) do
    Agent.update(__MODULE__, &update_state(&1, user))

    {:ok, "User created with successfully"}
  end

  def get(cpf), do: Agent.get(__MODULE__, &get_by_id(&1, cpf))

  defp update_state(state, %User{cpf: cpf} = user), do: Map.put(state, cpf, user)

  defp get_by_id(state, cpf) do
    case Map.get(state, cpf) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
