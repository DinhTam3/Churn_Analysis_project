-- CREATE DATABASE db_Churn;

-- use db_Churn;

select 
	Gender,
    count(Gender) as total_count_by_gender,
    count(Gender) * 100 / (SELECT count(*) from stg_churn) as pct_gender
from stg_churn
GROUP BY Gender;

select 
	Contract,
    count(Contract) as total_count_by_contract,
    count(Contract) * 100 / (SELECT count(*) from stg_churn) as pct_contract
from stg_churn
GROUP BY Contract;

select
	Customer_Status,
    count(Customer_Status) as total_count_by_customer_status,
    sum(Total_Revenue) as total_revenue,
    count(Customer_Status) * 100 / (select count(*) from stg_churn) as pct_customer_status,
    sum(Total_Revenue) * 100 / (select sum(Total_Revenue) from stg_churn) as pct_revenue_by_customer_status
from stg_churn
group by Customer_Status;

select 
	State,
    count(State) as total_count_by_state,
    count(State) * 100 / (SELECT count(*) from stg_churn) as pct_state
from stg_churn
GROUP BY State
order by pct_state desc
LIMIT 5;

SELECT 
    SUM(CASE WHEN Customer_ID = "" THEN 1 ELSE 0 END) AS Customer_ID_Null_Count,
    SUM(CASE WHEN Gender = "" THEN 1 ELSE 0 END) AS Gender_Null_Count,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_Null_Count,
    SUM(CASE WHEN Married = "" THEN 1 ELSE 0 END) AS Married_Null_Count,
    SUM(CASE WHEN State = "" THEN 1 ELSE 0 END) AS State_Null_Count,
    SUM(CASE WHEN Number_of_Referrals IS NULL THEN 1 ELSE 0 END) AS Number_of_Referrals_Null_Count,
    SUM(CASE WHEN Tenure_in_Months IS NULL THEN 1 ELSE 0 END) AS Tenure_in_Months_Null_Count,
    SUM(CASE WHEN Value_Deal = "" THEN 1 ELSE 0 END) AS Value_Deal_Null_Count,
    SUM(CASE WHEN Phone_Service = "" THEN 1 ELSE 0 END) AS Phone_Service_Null_Count,
    SUM(CASE WHEN Multiple_Lines = "" THEN 1 ELSE 0 END) AS Multiple_Lines_Null_Count,
    SUM(CASE WHEN Internet_Service = "" THEN 1 ELSE 0 END) AS Internet_Service_Null_Count,
    SUM(CASE WHEN Internet_Type = "" THEN 1 ELSE 0 END) AS Internet_Type_Null_Count,
    SUM(CASE WHEN Online_Security = "" THEN 1 ELSE 0 END) AS Online_Security_Null_Count,
    SUM(CASE WHEN Online_Backup = "" THEN 1 ELSE 0 END) AS Online_Backup_Null_Count,
    SUM(CASE WHEN Device_Protection_Plan = "" THEN 1 ELSE 0 END) AS Device_Protection_Plan_Null_Count,
    SUM(CASE WHEN Premium_Support = "" THEN 1 ELSE 0 END) AS Premium_Support_Null_Count,
    SUM(CASE WHEN Streaming_TV = "" THEN 1 ELSE 0 END) AS Streaming_TV_Null_Count,
    SUM(CASE WHEN Streaming_Movies = "" THEN 1 ELSE 0 END) AS Streaming_Movies_Null_Count,
    SUM(CASE WHEN Streaming_Music = "" THEN 1 ELSE 0 END) AS Streaming_Music_Null_Count,
    SUM(CASE WHEN Unlimited_Data = "" THEN 1 ELSE 0 END) AS Unlimited_Data_Null_Count,
    SUM(CASE WHEN Contract = "" THEN 1 ELSE 0 END) AS Contract_Null_Count,
    SUM(CASE WHEN Paperless_Billing = "" THEN 1 ELSE 0 END) AS Paperless_Billing_Null_Count,
    SUM(CASE WHEN Payment_Method = "" THEN 1 ELSE 0 END) AS Payment_Method_Null_Count,
    SUM(CASE WHEN Monthly_Charge IS NULL THEN 1 ELSE 0 END) AS Monthly_Charge_Null_Count,
    SUM(CASE WHEN Total_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Charges_Null_Count,
    SUM(CASE WHEN Total_Refunds IS NULL THEN 1 ELSE 0 END) AS Total_Refunds_Null_Count,
    SUM(CASE WHEN Total_Extra_Data_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Extra_Data_Charges_Null_Count,
    SUM(CASE WHEN Total_Long_Distance_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Long_Distance_Charges_Null_Count,
    SUM(CASE WHEN Total_Revenue IS NULL THEN 1 ELSE 0 END) AS Total_Revenue_Null_Count,
    SUM(CASE WHEN Customer_Status = "" THEN 1 ELSE 0 END) AS Customer_Status_Null_Count,
    SUM(CASE WHEN Churn_Category = "" THEN 1 ELSE 0 END) AS Churn_Category_Null_Count,
    SUM(CASE WHEN Churn_Reason = "" THEN 1 ELSE 0 END) AS Churn_Reason_Null_Count
FROM stg_churn;

/*
Rows with missing values:
    Value_Deal,
    Multiple_Lines,
    Internet_Type,
    Online_Security,
    Online_Backup,
    Device_Protection_Plan,
    Premium_Support,
    Streaming_TV,
    Streaming_Movies,
    Streaming_Music,
    Unlimited_Data,
    Churn_Category,
    Churn_Reason
*/
/*
CREATE TABLE `prod_churn` (
  `Customer_ID` text,
  `Gender` text,
  `Age` bigint DEFAULT NULL,
  `Married` text,
  `State` text,
  `Number_of_Referrals` bigint DEFAULT NULL,
  `Tenure_in_Months` int DEFAULT NULL,
  `Value_Deal` text,
  `Phone_Service` text,
  `Multiple_Lines` text,
  `Internet_Service` text,
  `Internet_Type` text,
  `Online_Security` text,
  `Online_Backup` text,
  `Device_Protection_Plan` text,
  `Premium_Support` text,
  `Streaming_TV` text,
  `Streaming_Movies` text,
  `Streaming_Music` text,
  `Unlimited_Data` text,
  `Contract` text,
  `Paperless_Billing` text,
  `Payment_Method` text,
  `Monthly_Charge` double DEFAULT NULL,
  `Total_Charges` double DEFAULT NULL,
  `Total_Refunds` double DEFAULT NULL,
  `Total_Extra_Data_Charges` bigint DEFAULT NULL,
  `Total_Long_Distance_Charges` double DEFAULT NULL,
  `Total_Revenue` double DEFAULT NULL,
  `Customer_Status` text,
  `Churn_Category` text,
  `Churn_Reason` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
*/

insert into prod_churn
SELECT 
    Customer_ID,
    Gender,
    Age,
    Married,
    State,
    Number_of_Referrals,
    Tenure_in_Months,
    CASE WHEN Value_Deal = "" THEN "None" ELSE Value_Deal END AS Value_Deal,
    Phone_Service,
    CASE WHEN Multiple_Lines = "" THEN "No" ELSE Multiple_Lines END AS Multiple_Lines,
    Internet_Service,
    CASE WHEN Internet_Type = "" THEN "None" ELSE Internet_Type END AS Internet_Type,
    CASE WHEN Online_Security = "" THEN "No" ELSE Online_Security END AS Online_Security,
    CASE WHEN Online_Backup = "" THEN "No" ELSE Online_Backup END AS Online_Backup,
    CASE WHEN Device_Protection_Plan = "" THEN "No" ELSE Device_Protection_Plan END AS Device_Protection_Plan,
    CASE WHEN Premium_Support = "" THEN "No" ELSE Premium_Support END AS Premium_Support,
    CASE WHEN Streaming_TV = "" THEN "No" ELSE Streaming_TV END AS Streaming_TV,
    CASE WHEN Streaming_Movies = "" THEN "No" ELSE Streaming_Movies END AS Streaming_Movies,
    CASE WHEN Streaming_Music = "" THEN "No" ELSE Streaming_Music END AS Streaming_Music,
    CASE WHEN Unlimited_Data = "" THEN "No" ELSE Unlimited_Data END AS Unlimited_Data,
    Contract,
    Paperless_Billing,
    Payment_Method,
    Monthly_Charge,
    Total_Charges,
    Total_Refunds,
    Total_Extra_Data_Charges,
    Total_Long_Distance_Charges,
    Total_Revenue,
    Customer_Status,
    CASE WHEN Churn_Category = "" THEN "Others" ELSE Churn_Category END AS Churn_Category,
    CASE WHEN Churn_Reason = "" THEN "Others" ELSE Churn_Reason END AS Churn_Reason
FROM stg_churn;

Create View vw_ChurnData as
	select * from prod_Churn where Customer_Status In ('Churned', 'Stayed');
    
Create View vw_JoinData as
	select * from prod_Churn where Customer_Status = 'Joined';
