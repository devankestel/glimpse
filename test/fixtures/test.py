import pytest
from my_fancy_file import my_fancy_method

class MyFancyTest:

    def setup(self, my_fancy_factory):

        self.my_fancy = my_fancy_factory()

    def test_my_fancy_method(self):
        arg1 = "fancy"
        arg2 = ["method"]

        expected_result = ["fancy", "method"]

        result = my_fancy_method(arg1, arg2)

        assert result == expected_result
        

    