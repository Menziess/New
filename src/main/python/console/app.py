import importlib
import time
import sys


def main(count=0):
    """
    Main function.
    """

    sys.path.insert(0, 'src/main/scripts')
    import greeter
    importlib.reload(greeter)

    try:
        while True:
            count += 1
            print(greeter.greet(count))
    except KeyboardInterrupt:
        print("\n\nPaused...")


if __name__ == "__main__":
    try:
        while True:
            main()
            input("Press any key to reload app")
    except KeyboardInterrupt:
        print("\n\nStopped app...")
