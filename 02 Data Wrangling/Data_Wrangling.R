require("jsonlite")
require("RCurl")
require("dplyr")
# Change the USER and PASS below to be your UTEid
df <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from EMPLOYEE_SALARIES__2014"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_pjo293', PASS='orcl_pjo293', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))
df
summary(df)
head(df)

# plot average salary, group by gender
df %>% group_by(GENDER) %>% summarize(mean(X2014_GROSS_PAY_RECEIVED)) %>% tbl_df

# plot average salary group by department
df %>% group_by(DEPARTMENT) %>% summarize(mean(CURRENT_ANNUAL_SALARY)) %>% tbl_df
