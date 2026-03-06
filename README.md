# Loan application

Analysis of the [PKDD'99 Financial dataset](https://relational.fel.cvut.cz/dataset/Financial), a Czech bank dataset containing information about accounts, clients, transactions, and loans.

## Data model

```mermaid
erDiagram
    district {
        int district_id PK
        string A2 "district name"
        string A3 "region"
        int A4 "no. of inhabitants"
    }

    account {
        int account_id PK
        int district_id FK
        string frequency
        date date
    }

    client {
        int client_id PK
        string gender
        date birth_date
        int district_id FK
    }

    disp {
        int disp_id PK
        int client_id FK
        int account_id FK
        string type
    }

    loan {
        int loan_id PK
        int account_id FK
        date date
        int amount
        int duration
        float payments
        string status
    }

    card {
        int card_id PK
        int disp_id FK
        string type
        date issued
    }

    order {
        int order_id PK
        int account_id FK
        string bank_to
        int account_to
        float amount
        string k_symbol
    }

    trans {
        int trans_id PK
        int account_id FK
        date date
        string type
        string operation
        int amount
        int balance
        string k_symbol
        string bank
        int account
    }

    district ||--o{ account : "branch location"
    district ||--o{ client : "client residence"
    client ||--o{ disp : "has access"
    account ||--o{ disp : "accessed by"
    account ||--o{ order : "has orders"
    account ||--o{ trans : "has transactions"
    account ||--o| loan : "has loan"
    disp ||--o{ card : "issued to"
```
