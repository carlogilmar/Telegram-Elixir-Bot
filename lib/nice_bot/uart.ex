defmodule NiceBot.Uart do

  use GenServer

  # Client
  def start_link() do
    GenServer.start_link(__MODULE__, [], [name: __MODULE__])
  end

  def init_uart( ) do
    GenServer.call( __MODULE__, :init_uart )
  end

  # Server
  def init(_) do
    IO.puts "UART Server init..."
    {:ok, 1}
  end

  def handle_call( :init_uart, _, state ) do
    {:ok, uart} = Nerves.UART.start_link
    {:reply, uart, state}
  end

end
