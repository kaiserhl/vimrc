
def example(n: int) -> str:
    print(type(n))
    return 'hello'

example("a")  # << incorrect, we've passed a String and not an Integer
