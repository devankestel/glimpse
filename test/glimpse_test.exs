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

  test "read in an integer CSV to dataframe" do
    expected_dataframe = DF.new([
      %{a: 1, b: 1, c: 1, d: 0, e: 0, f: 0, g: 1, h: 1, i: 1, j: nil, k: nil, l: nil, m: nil},
      %{a: 0, b: 0, c: 0, d: 1, e: 1, f: 0, g: 0, h: 1, i: 1, j: nil, k: nil, l: nil, m: nil},
      %{a: 1, b: 1, c: 1, d: 1, e: 1, f: 1, g: 1, h: 1, i: 1, j: 1, k: 1, l: 1, m: 0}
    ])
    cwd = File.cwd!
    filepath = "test/fixtures/test.csv"
    path = "#{cwd}/#{filepath}"
    dtypes =  [
      {"a", :integer},
      {"b", :integer},
      {"c", :integer},
      {"d", :integer},
      {"e", :integer},
      {"f", :integer},
      {"g", :integer},
      {"h", :integer},
      {"i", :integer},
      {"j", :integer},
      {"k", :integer},
      {"l", :integer},
      {"m", :integer},
    ]
    delimiter = ","
    header = true

    result_dataframe = Glimpse.read(path, dtypes, delimiter, header)
    # groups
    # names
    # data
    assert result_dataframe.dtypes == expected_dataframe.dtypes
    assert DF.shape(result_dataframe) == DF.shape(expected_dataframe)
    assert DF.to_columns(result_dataframe) == DF.to_columns(expected_dataframe)

  end

  test "read in a python file to dataframe" do
    expected_dataframe = DF.new([
      %{line: "import pytest"},
      %{line: "from my_fancy_file import my_fancy_method"},
      %{line: nil},
      %{line: "class MyFancyTest:"},
      %{line: nil},
      %{line: "def setup(self, my_fancy_factory):"},
      %{line: nil},
      %{line: "self.my_fancy = my_fancy_factory()"},
      %{line: nil},
      %{line: "def test_my_fancy_method(self):"},
      %{line: "arg1 = \"fancy\""},
      %{line: "arg2 = [\"method\"]"},
      %{line: nil},
      %{line: "expected_result = [\"fancy\", \"method\"]"},
      %{line: nil},
      %{line: "result = my_fancy_method(arg1, arg2)"},
      %{line: nil},
      %{line: "assert result == expected_result"},
      %{line: nil},
      %{line: nil},
    ])
    cwd = File.cwd!
    filepath = "test/fixtures/test.py"
    path = "#{cwd}/#{filepath}"
    dtypes =  [
      {"line", :string},
    ]

    delimiter = "\n"
    header = false

    result_dataframe = Glimpse.read(path, dtypes, delimiter, header)
    # groups
    # names
    # data
    assert result_dataframe.dtypes == expected_dataframe.dtypes
    assert DF.shape(result_dataframe) == DF.shape(expected_dataframe)
    assert DF.to_columns(result_dataframe) == DF.to_columns(expected_dataframe)

  end

  test "create_dtypes for integers CSV" do
    expected_dtypes = [
      {"a", :integer},
      {"b", :integer},
      {"c", :integer},
      {"d", :integer},
      {"e", :integer},
      {"f", :integer},
      {"g", :integer},
      {"h", :integer},
      {"i", :integer},
      {"j", :integer},
      {"k", :integer},
      {"l", :integer},
      {"m", :integer},
      ] 

      column_names = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m"]

      result_dtypes = Glimpse.create_dtypes(column_names)

      assert result_dtypes == expected_dtypes
  end

  test "read in an integer CSV to dataframe integration test" do
    expected_dataframe = DF.new([
      %{a: 1, b: 1, c: 1, d: 0, e: 0, f: 0, g: 1, h: 1, i: 1, j: nil, k: nil, l: nil, m: nil},
      %{a: 0, b: 0, c: 0, d: 1, e: 1, f: 0, g: 0, h: 1, i: 1, j: nil, k: nil, l: nil, m: nil},
      %{a: 1, b: 1, c: 1, d: 1, e: 1, f: 1, g: 1, h: 1, i: 1, j: 1, k: 1, l: 1, m: 0}
    ])
    cwd = File.cwd!
    filepath = "test/fixtures/test.csv"
    path = "#{cwd}/#{filepath}"
    column_names = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m"]

    dtypes = Glimpse.create_dtypes(column_names)
    delimiter = ","
    header = true

    result_dataframe = Glimpse.read(path, dtypes, delimiter, header)
    # groups
    # names
    # data
    assert result_dataframe.dtypes == expected_dataframe.dtypes
    assert DF.shape(result_dataframe) == DF.shape(expected_dataframe)
    assert DF.to_columns(result_dataframe) == DF.to_columns(expected_dataframe)
  end
end
