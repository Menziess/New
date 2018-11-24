import logging
import argparse
import time

logger = logging.getLogger(__name__)


def greet(i: int) -> str:
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


if __name__ == "__main__":
    """
    When run as a script, the arguments are parsed, and the process logged.
    """

    parser = argparse.ArgumentParser()
    parser.add_argument('i', type=int)

    group = parser.add_mutually_exclusive_group()
    group.add_argument("-v", "--verbose", action="store_true")
    group.add_argument("-q", "--quiet", action="store_true")

    args = parser.parse_args()

    logging.basicConfig()

    if args.verbose:
        logger.setLevel(logging.DEBUG)
    if args.quiet:
        logger.setLevel(logging.WARN)

    if args.i < 0:
        logger.warning(f'fibo called with n {args.i}')
        raise ValueError(f"{args.i} is too small")
    else:
        logger.debug(f'greeting user with {args.i}')

    print(greet(args.i))
