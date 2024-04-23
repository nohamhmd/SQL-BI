# SQL-BI

## Overview

This project demonstrates an integrated solution for data management and reporting using SQL Server Integration Services (SSIS) and SQL Server Reporting Services (SSRS). It combines the functionality of both SSIS and SSRS to extract, transform, load (ETL) data, and generate insightful reports for analysis.

## SSIS Part

Description: The SSIS component focuses on the ETL process, where data is extracted from the "ITI DB," transformed according to specified requirements, and loaded into target databases.

### Key Features:

• Data transfer between databases.
 
•Truncating tables before data transfer.

• Merge and split data based on specified criteria.

• Error handling and display of error messages.
## SSRS Part

Description: The SSRS component focuses on report generation using SQL Server Reporting Services. It utilizes data from the same "ITI DB" to create meaningful reports for analysis.

### Key Features:

• Creation of tabular reports displaying student data.

• Customization of report headers and footers.

• Conditional formatting to highlight specific data points.

• Parameterized reports allowing user interaction.

• Integration with Analysis Services cubes for data filtering.

• Deployment of reports to a designated server.

## Prerequisites

• SQL Server with Integration Services and Reporting Services installed.

• Access to the "ITI DB" for data extraction and reporting.

• Download the ITI database file, SSIS, and SSRS to run the project
