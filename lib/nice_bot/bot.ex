defmodule NiceBot.Bot do
  @bot_name :nice_bot
  def bot(), do: @bot_name

  require Logger
  use Telex.Bot, name: @bot_name
  use Telex.Dsl

  def handle({:command, "start", msg}, _name, _extra) do
    Logger.info("::Bot Contestando: Start")
    IO.inspect msg
    answer("hola! Soy el inmundo Bot!")
  end

  def handle({:command, "hello", msg}, _name, _extra) do
    Logger.info("::Bot Contestando: Hello")
    IO.inspect msg
    answer(" 😎  Holiiiii Como estás? ")
  end

end
