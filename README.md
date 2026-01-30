# 📊 ICMS Control System

This project focuses on the development of a relational database structure designed to handle fiscal data, specifically focusing on invoice management and ICMS tax calculations. 

The goal is to simulate a real-world fiscal environment, managing suppliers and automating the calculation of tax credits and liabilities based on normalized data modeling.

In this project, you will find advanced SQL queries for financial reporting, and strict business rules applied through database constraints.

## 🛠️ Technologies
* **Database:** MySQL 8.0
* **Language:** SQL (DDL, DML, DQL)
* **Tool:** MySQL Workbench
* **Version Control:** Git & GitHub

## 📁 Project Structure

```text
controle-icms/
├── docs/           # Technical documentation and references
├── sql/            # SQL scripts (Schema, Inserts, and Queries)
├── screenshots/    # Visual evidence of database execution
└── README.md       # Project documentation

## Project Initialization

## Step by Step

Clone the project by executing:


```
```sh
git clone [https://github.com/SEU_USUARIO/controle-icms.git]
```
Access the project folder:

```sh
cd controle-icms
```
Database Setup
To set up the database environment, follow the execution order of the scripts located in the sql/ folder:

```sh
Create Database: Run sql/01-criar-banco.sql to initialize the controle_icms schema.
```

```sh
Create Tables: Run sql/02-criar-tabelas.sql to generate the structure for Suppliers, Invoices, and Tax Summaries.
```

```sh
Data Population: Run sql/03-inserir-dados-teste.sql to populate the tables with realistic test data.
```

📊 SQL Features & Analysis
The project includes several analytical queries to provide business insights:

Total ICMS Credit: Calculation per supplier for tax reconciliation.

Supplier Ranking: Identification of top partners by purchase volume.

Monthly Summary: Consolidation of tax entries and average rates.

Aging Report: Tracking pending invoices and delay days.

👨‍💻 Author
Edinor de Souza Neto - [LinkedIn](https://www.linkedin.com/in/edinor-de-souza-neto/)