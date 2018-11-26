from src.main.scripts.greeter import greet
import pytest


@pytest.mark.describe("A test that always works")
def test_trivial():
    assert 1 + 1 == 2


@pytest.mark.parametrize("i, expected", (
    (1, "Hello 1"),
    (100, "Hello 100")
))
def test_hello_printer(i, expected):
    assert greet(i) == expected
