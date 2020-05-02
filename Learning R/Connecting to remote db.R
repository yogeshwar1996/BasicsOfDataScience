library(odbc)
library(DBI)
sort(unique(odbcListDrivers()[[1]]))
con <- dbConnect(odbc(), 
                 Driver = "PostgreSQL Unicode", 
                 Server = "", 
                 Database = "", 
                 UID = "",
                 PWD = "")

data <- dbReadTable(con, "Customer_Information")
View(data)
str(data)
names(data)