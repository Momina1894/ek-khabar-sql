# Ek Khabar SQL Analysis
SQL analyses of 8,000+ headlines from 11 Pakistani news outlets, collected by my project Ek Khabar.

## Data
Source: Ek Khabar's SQLite database (latest GitHub release). Not included in this repo.

## Data dictionary
| Table | One row means | Rows | Important columns |
| --- | --- | --- | --- |
| headlines | one headline from one outlet | 8,123 | id, outlet, title, published_at, story_id |
| ... | ... | ... | ... |

## Star schema
```mermaid
erDiagram
    DIM_OUTLET ||--o{ FACT_HEADLINE : publishes
    DIM_STORY ||--o{ FACT_HEADLINE : groups
    DIM_DATE ||--o{ FACT_HEADLINE : "published on"
    FACT_HEADLINE ||--o{ BRIDGE_LOADED_WORD : contains
    FACT_HEADLINE {
        int headline_id PK
        int outlet_id FK
        int story_id FK
        date published_date FK
        string section
        int loaded_word_count
    }
    DIM_OUTLET {
        int outlet_id PK
        string outlet_name
        string outlet_type
    }
    DIM_STORY {
        int story_id PK
        datetime first_seen
        int outlet_count
    }
    DIM_DATE {
        date date PK
        string week
        string month
    }
    BRIDGE_LOADED_WORD {
        int headline_id FK
        string word
    }
```

## Findings
1. **Headlines per outlet per week:** (your finding here)
