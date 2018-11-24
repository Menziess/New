import time


def hello_printer(i: int) -> str:
    """
    Prints hello.

    Prints hello and appends the number passed.

    Parameters
    ----------
    i : int
        The number that is appended to the message

    Returns
    -------
    str
        The hello message

    """
    time.sleep(1)
    return f"Hello {i}"


def main(count=0):
    """
    Main function.
    """
    while True:
        count += 1
        print(hello_printer(count))


if __name__ == "__main__":
    main()
