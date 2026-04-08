import org.apache.spark.sql.types._

val subSchema = StructType(Array(
  StructField("id", StringType, true),
  StructField("author", StringType, true),
  StructField("created_utc", LongType, true),
  StructField("num_comments", LongType, true),
  StructField("score", LongType, true),
  StructField("selftext", StringType, true),
  StructField("title", StringType, true)
))

var submissionsDF = spark.read.schema(subSchema).json("/project/macs40123/amritap1/macs-40123-amritapathak1/data/submissions/*2020*")
submissionsDF.write.mode("append").parquet("/project/macs40123/amritap1/macs-40123-amritapathak1/final_data_with_id/submissions")
var submissionsDF = spark.read.schema(subSchema).json("/project/macs40123/amritap1/macs-40123-amritapathak1/data/submissions/*2021*")
submissionsDF.write.mode("append").parquet("/project/macs40123/amritap1/macs-40123-amritapathak1/final_data_with_id/submissions")
var submissionsDF = spark.read.schema(subSchema).json("/project/macs40123/amritap1/macs-40123-amritapathak1/data/submissions/*2022*")
submissionsDF.write.mode("append").parquet("/project/macs40123/amritap1/macs-40123-amritapathak1/final_data_with_id/submissions")

val commSchema = StructType(Seq(
  StructField("id", StringType, true),
  StructField("author", StringType, true),
  StructField("author_created_utc", LongType, true),
  StructField("author_flair_text", StringType, true),
  StructField("body", StringType, true),
  StructField("controversiality", LongType, true),
  StructField("created_utc", LongType, true),
  StructField("is_submitter", BooleanType, true),
  StructField("score", LongType, true)
))

var commentsDF = spark.read.schema(commSchema).json("/project/macs40123/amritap1/macs-40123-amritapathak1/data/comments/*2020*")
commentsDF.write.mode("append").parquet("/project/macs40123/amritap1/macs-40123-amritapathak1/final_data_with_id/comments")
var commentsDF = spark.read.schema(commSchema).json("/project/macs40123/amritap1/macs-40123-amritapathak1/data/comments/*2021*")
commentsDF.write.mode("append").parquet("/project/macs40123/amritap1/macs-40123-amritapathak1/final_data_with_id/comments")
var commentsDF = spark.read.schema(commSchema).json("/project/macs40123/amritap1/macs-40123-amritapathak1/data/comments/*2022*")
commentsDF.write.mode("append").parquet("/project/macs40123/amritap1/macs-40123-amritapathak1/final_data_with_id/comments")

var submissionsDF = spark.read.schema(subSchema).parquet("/project/macs40123/amritap1/macs-40123-amritapathak1/final_data_with_id/submissions")
var commentsDF = spark.read.schema(commSchema).parquet("/project/macs40123/amritap1/macs-40123-amritapathak1/final_data_with_id/comments")

submissionsDF.select(
  date_format(from_unixtime(min($"created_utc")), "yyyy-MM-dd HH:mm:ss").alias("min_date"),
  date_format(from_unixtime(max($"created_utc")), "yyyy-MM-dd HH:mm:ss").alias("max_date")
).show(false)

commentsDF.select(
  date_format(from_unixtime(min($"created_utc")), "yyyy-MM-dd HH:mm:ss").alias("min_date"),
  date_format(from_unixtime(max($"created_utc")), "yyyy-MM-dd HH:mm:ss").alias("max_date")
).show(false)

