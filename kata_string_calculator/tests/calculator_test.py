import pytest
from calc.calculator import string_calculator


def test_empty_string_returns_zero():
    assert string_calculator("") == 0


def test_none_returns_zero():
    assert string_calculator(None) == 0


def test_single_number_returns_the_correct_value():
    assert string_calculator("1") == 1


def test_two_evaluates_to_a_correct_value():
    assert string_calculator("2") == 2


def test_two_numbers_comma_delimeted_returns_the_sum_of_two_numbers():
    assert string_calculator("2,5") == 7


def test_more_than_two_numbers_comma_delimeted_returns_the_sum_the_numbers():
    assert string_calculator("1,2,3") == 6


def test_letter_evaluates_to_zero():
    assert string_calculator("a") == 0


def test_letters_comma_separated_with_numbers_evaluates_to_sum():
    assert string_calculator("1,a,2") == 3
