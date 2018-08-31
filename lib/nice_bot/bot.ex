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

  def handle({:text, text, msg}, _name, _extra) do
    IO.puts "Bot respondiendo..."
    IO.inspect text
    #IO.inspect msg
    send_to_arduino(text)
    a = answer(" Bot de Elixir desde Raspberrypi Respondiendo")
  end

  def send_to_arduino( message ) do
    uart = NiceBot.Uart.init_uart()
    manage_led( message, uart )
  end

  def manage_led("1", pid), do: Nerves.UART.write(pid, "1")
  def manage_led("2", pid), do: Nerves.UART.write(pid, "2")
  def manage_led("3", pid), do: Nerves.UART.write(pid, "3")
  def manage_led(_, pid), do: Nerves.UART.write(pid, "0")

end
