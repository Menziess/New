from pyspark.sql import SparkSession


def main(args: list):
    spark: SparkSession = SparkSession.builder.enableHiveSupport().getOrCreate()
    babies = spark.read.csv(args[0], header=True).withColumnRenamed(
        "First Name", "first_name")
    babies.write.format('orc').saveAsTable('baby_names')
    spark.stop()


if __name__ == "__main__":
    try:
        while True:
            main([])
            input("Press any key to reload app")
    except KeyboardInterrupt:
        print("\n\nStopped app...")
