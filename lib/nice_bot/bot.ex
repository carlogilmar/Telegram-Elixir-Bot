defmodule NiceBot.Bot do
  @bot_name :nice_bot
  def bot(), do: @bot_name

  require Logger
  use Telex.Bot, name: @bot_name
  use Telex.Dsl

  def handle({:command, "start", msg}, _name, _extra) do
    answer("hola! Soy el inmundo Bot!")
  end
end
