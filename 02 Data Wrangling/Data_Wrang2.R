require("jsonlite")
require("RCurl")
require("dplyr")
require("ggplot2")

# Change the USER and PASS below to be your UTEid
df <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from EMPLOYEE_SALARIES__2014"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_pjo293', PASS='orcl_pjo293', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

# most common departments, salary distribution
df %>% mutate(price_percent = cume_dist(X2014_GROSS_PAY_RECEIVED)) %>% filter(DEPARTMENT %in% c("PIO", "OHR","HCA","CAT","CEC","CCL","REC","FIN","DTS","DEP","SHF","DPS","LIB","DLC","DGS","COR","DOT","FRS","HHS","POL")) %>% ggplot(aes(x = DEPARTMENT, y = X2014_GROSS_PAY_RECEIVED, color = GENDER)) + geom_point()
