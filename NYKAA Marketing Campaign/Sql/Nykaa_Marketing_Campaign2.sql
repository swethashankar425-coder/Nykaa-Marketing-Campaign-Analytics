CREATE DATABASE Nykaa_Marketing_Campaign;
USE Nykaa_Marketing_Campaign;
SELECT * FROM nykaa_campaign_cleaned
SELECT COUNT(*) FROM nykaa_campaign_cleaned

SELECT TOP 5 * FROM nykaa_campaign_cleaned;
--AVERAGE CTR
SELECT AVG(CTR) AS Avg_CTR
FROM nykaa_campaign_cleaned
--HIGHEST ROI CAMPAIGN
SELECT TOP 1 Campaign_Type, ROI
FROM nykaa_campaign_cleaned
ORDER BY ROI DESC;
--BEST PERFORMING CHANNEL
SELECT Channel_Used,
       AVG(Conversion_Rate) AS Avg_Conversion
FROM nykaa_campaign_cleaned
GROUP BY Channel_Used
ORDER BY Avg_Conversion DESC;
--TOTAL CLICKS BY CHANNEL
SELECT Channel_Used,
       SUM(Clicks) AS Total_Clicks
FROM nykaa_campaign_cleaned
GROUP BY Channel_Used
ORDER BY Total_Clicks DESC;
--TOP 5 CAMPAIGN ID BY ENGAGEMENT SCORE
SELECT TOP 5 Campaign_ID,
       Engagement_Score
FROM nykaa_campaign_cleaned
ORDER BY Engagement_Score DESC;
--TOP 5 CAMPAIGN ID BY CPC
SELECT TOP 5 Campaign_ID,
       CPC
FROM nykaa_campaign_cleaned
ORDER BY CPC DESC;
--TOP 5 CAMPAIGN ID BY CPL
SELECT TOP 5 Campaign_ID,
       CPL
FROM nykaa_campaign_cleaned
ORDER BY CPL DESC;
--ROI CATEGORY ANALYSIS
SELECT 
    CASE
        WHEN ROI > 200 THEN 'High ROI'
        WHEN ROI BETWEEN 100 AND 200 THEN 'Medium ROI'
        ELSE 'Low ROI'
    END AS ROI_Category,
    
    COUNT(*) AS Total_Campaigns
FROM nykaa_campaign_cleaned
GROUP BY 
    CASE
        WHEN ROI > 200 THEN 'High ROI'
        WHEN ROI BETWEEN 100 AND 200 THEN 'Medium ROI'
        ELSE 'Low ROI'
    END;
    --TARGET AUDIENCE BY AVERAGE ENGAGEMENT
    SELECT Target_Audience,
       AVG(Engagement_Score) AS Avg_Engagement 
FROM nykaa_campaign_cleaned
GROUP BY Target_Audience
ORDER BY Avg_Engagement DESC;
--CUSTOMER SEGMENT BY AVERAGE ENGAGEMENT SCORE
SELECT Customer_Segment,
       AVG(Engagement_Score) AS Avg_Engagement
       FROM nykaa_campaign_cleaned
       GROUP BY Customer_Segment
       ORDER BY Avg_Engagement DESC;
       --LANGUAGE BY AVERAGE ENGAGEMENT SCORE
       SELECT Language,
       AVG(Engagement_Score) AS Avg_Engagement
       FROM nykaa_campaign_cleaned
       GROUP BY Language
       ORDER BY Avg_Engagement DESC;
        --FUNNEL ANALYSIS
    SELECT Impressions  as Total_Impressions,
           Clicks as Total_Clicks,
           Leads as Total_Leads,
           Conversions as Total_Conversions,
           Revenue as Total_Revenue,
           Acquisition_Cost as Total_Acquisition_Cost,
           ROI as Total_ROI
       FROM nykaa_campaign_cleaned;

       SELECT Campaign_ID,
       ROI,
       CTR
FROM nykaa_campaign_cleaned
WHERE ROI < 50
AND CTR < 2;


       
