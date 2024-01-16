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

  def create_dtypes(column_names) do
    column_names |> 
      Enum.map(
        fn column_name ->
          {column_name, :integer}
        end
      )  
  end 

  def read(path, dtypes) do
    DF.from_csv!(path, dtypes: dtypes)
  end

# notes 
# cwd = File.cwd!
# python_file_path = "#{cwd}/test/fixtures/test.py"
# df = DF.from_csv!(python_file_path, delimiter: "\n", header: false)
# df[0][0] |> String.codepoints
# ["i", "m", "p", "o", "r", "t", " ", "p", "y", "t", "e", "s", "t"]
# char_line = df[0][0] |> String.codepoints
# char_line_series = Explorer.Series.from_list(char_line)
# DF.new(%{line: char_line_series})
# 1 string column named line with 13 rows each a character
#Explorer.DataFrame<
  # Polars[13 x 1]
  # line string ["i", "m", "p", "o", "r", ...]
# maybe try a mutation query
end

