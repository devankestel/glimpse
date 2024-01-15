defmodule GlimpseTest do
  use ExUnit.Case
  doctest Glimpse
  require Explorer
  alias Explorer.DataFrame, as: DF

  test "greets the world" do
    assert Glimpse.hello() == :world
  end

  test "creates initial svg tag" do
    assert Glimpse.svg_start() == 
    """
    <svg>
    """
  end

  test "creates svg close tag" do
    assert Glimpse.svg_end() == 
    """
    </svg>
    """
  end

  test "render" do
    assert Glimpse.render_svg() == 
    """
    <svg>
    </svg>
    """ 
  end

  test "read in a dataframe" do
    expected_dataframe = DF.new([
      %{a: 1, b: 1, c: 1, d: 0, e: 0, f: 0, g: 1, h: 1, i: 1, j: nil, k: nil, l: nil, m: nil},
      %{a: 0, b: 0, c: 0, d: 1, e: 1, f: 0, g: 0, h: 1, i: 1, j: nil, k: nil, l: nil, m: nil},
      %{a: 1, b: 1, c: 1, d: 1, e: 1, f: 1, g: 1, h: 1, i: 1, j: 1, k: 1, l: 1, m: 0}
    ])
    cwd = File.cwd!
    filepath = "test/fixtures/test.csv"
    path = "#{cwd}/#{filepath}"
    result_dataframe = Glimpse.read(path)
    # groups
    # names
    # data
    assert result_dataframe.dtypes == expected_dataframe.dtypes
    assert DF.to_columns(result_dataframe) == DF.to_columns(expected_dataframe)

  end
end
