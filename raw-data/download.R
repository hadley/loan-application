library(DBI)
library(nanoparquet)

con <- dbConnect(
  RMariaDB::MariaDB(),
  host = "relational.fel.cvut.cz",
  port = 3306,
  user = "guest",
  password = "ctu-relational",
  dbname = "financial"
)

tables <- dbListTables(con)
dir.create("raw-data", showWarnings = FALSE)

for (table in tables) {
  message("Exporting ", table, "...")
  df <- dbReadTable(con, table)
  write_parquet(df, file.path("raw-data", paste0(table, ".parquet")))
  message("  ", nrow(df), " rows")
}

dbDisconnect(con)
message("Done!")
