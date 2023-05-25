defmodule ExceptionSample.Example1 do
  @moduledoc """
  Example 1: without any handling.
  """

  use GenServer

  def ex1() do
    set(5)
    add(7)
    IO.puts("5 + 7 = #{value()}")
    div(3)
    IO.puts("12 / 3 = #{value()}")
  end

  def ex2() do
    set(5)
    add(7)
    IO.puts("5 + 7 = #{value()}")
    div(3)
    IO.puts("12 / 3 = #{value()}")
    div(0)
    IO.puts("4 / 0 = #{value()}")
  end

  # call first time

  def start_link() do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  # division

  def my_div(x, y) do
    div(x, y) # x / y
  end

  # code

  def value() do
    GenServer.call(__MODULE__, :value)
  end

  def set(value) do
    GenServer.cast(__MODULE__, {:set, value})
  end

  def add(value) do
    GenServer.cast(__MODULE__, {:add, value})
  end

  def sub(value) do
    GenServer.cast(__MODULE__, {:sub, value})
  end

  def mul(value) do
    GenServer.cast(__MODULE__, {:mul, value})
  end

  def div(value) do
    GenServer.cast(__MODULE__, {:div, value})
  end

  @impl true
  def init(acc) do
    {:ok, acc}
  end

  @impl true
  def handle_call(:value, _from, acc) do
    {:reply, acc, acc}
  end

  @impl true
  def handle_cast({:set, value}, _acc) do
    {:noreply, value}
  end

  @impl true
  def handle_cast({:add, value}, acc) do
    {:noreply, acc + value}
  end

  @impl true
  def handle_cast({:sub, value}, acc) do
    {:noreply, acc - value}
  end

  @impl true
  def handle_cast({:mul, value}, acc) do
    {:noreply, acc * value}
  end

  @impl true
  def handle_cast({:div, value}, acc) do
    {:noreply, my_div(acc, value)}
  end
end
