defmodule Flightex.Users.User do
  @keys [:name, :email, :cpf, :id]

  @enforce_keys @keys
  defstruct @keys

  def build(name, email, cpf) when is_bitstring(cpf) do
    {:ok, %__MODULE__{id: UUID.uuid4(), email: email, cpf: cpf, name: name}}
  end

  def build(_name, _email, _cpf), do: {:error, "Cpf must be a String"}
end
