library(odbc)
sort(unique(odbcListDrivers()[[1]]))
con <- dbConnect(odbc(), 
                 Driver = "PostgreSQL Unicode", 
                 Server = "", 
                 Database = "", 
                 UID = "",
                 PWD = "")

