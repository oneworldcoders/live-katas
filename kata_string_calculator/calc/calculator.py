import re


def string_calculator(expression: str) -> int:
    if expression is None or expression == "":
        return 0
    elif has_comma(expression):
        return sum((parse_int(token) for token in expression.split(",")))
    return parse_int(expression)


def has_comma(expression: str) -> bool:
    return "," in expression


def parse_int(expression: str) -> int:
    if re.match("\\d+$", expression):
        return int(expression)
    return 0
