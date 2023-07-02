# SimpleDataWarehouse

This is a project to build a simple data warehouse based on the source data that consists of several tables. The data warehouse will consist of one Fact table and several Dimension tables. The objectives for this project are as follows:

* Importing/Restoring the `Staging Database`.

* Creating a Database called `DWH_Project`, and creating Fact and Dimension tables based on the tables in the Staging Database.

* Creating an ETL Job in the Talend application to move data from the `Staging` to the Data Warehouse. For the DimCustomer table, perform data transformation by converting the data in the FirstName and LastName columns to uppercase, and then combine these two columns into a single column named CustomerName.

* Creating a Store Procedure (SP) to display a summary of sales orders based on the shipping status.
