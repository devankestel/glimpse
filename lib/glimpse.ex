defmodule Glimpse do
  require Explorer
  alias Explorer.DataFrame, as: DF
  @moduledoc """
  Documentation for `Glimpse`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Glimpse.hello()
      :world

  """
  def hello do
    :world
  end

  def svg_start do
    """
    <svg>
    """ 
  end

  def svg_end do 
    """
    </svg>
    """
  end

  def render_svg do 
    header = svg_start()
    footer = svg_end()
    Enum.join([header, footer])
  end

  def read(path) do
    dtypes = [
      {"a", :integer},
      {"b", :integer},
      {"c", :integer},
      {"d", :integer},
      {"e", :integer},
      {"f", :integer},
      {"h", :integer},
      {"i", :integer},
      {"j", :integer},
      {"k", :integer},
      {"l", :integer},
      {"m", :integer},
      ]
    DF.from_csv!(path, dtypes: dtypes)
  end
end
