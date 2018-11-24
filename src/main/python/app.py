import time
import greeter


def main(count=0):
    """
    Main function.
    """
    while True:
        count += 1
        print(greeter.greet(count))


if __name__ == "__main__":
    main()
