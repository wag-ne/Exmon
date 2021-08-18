defmodule ExMon.Game do
  alias ExMon.Player
  use Agent

  def start(computer, player) do
    initial_value = %{computer: computer, player: player, turn: :player, status: :started}

    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def info do
    Agent.get(__MODULE__, & &1)
  end

  def update(state) do
    Agent.update(__MODULE__, fn _ -> update_game_status(state) end)
  end

  def player, do: Map.get(info(), :player)
  def turn, do: Map.get(info(), :turn)
  def fetch_player(player), do: Map.get(info(), player)

  defp update_game_status(%{player: %Player{life: life}, computer: %Player{life: computer_life}} == state)
    when player_life == 0 or computer_life == 0, do
end
