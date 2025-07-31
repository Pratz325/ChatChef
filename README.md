# ChatChef: Personalized Recipe Recommender

This project implements a SQL-driven, personalized recipe recommendation system. The solution is built around a relational schema supporting recipe data, user preferences, allergens, and substitution logic, and is ideal for educational or prototype purposes.

## Features

- Relational schema for recipes, ingredients, user queries, and substitutions
- SQL queries for advanced filtering (by allergen, available ingredients, and more)
- Oracle PL/SQL stored procedure to generate allergen-safe recipe recommendations
- Example data for initial setup and demonstration

## Getting Started

### Requirements

- Oracle Database, or compatible SQL environment

### Setup

1. **Clone this repository:**
   git clone https://github.com/Pratz325/ChatChef.git
   cd ChatChef

2. **Run the schema definition:**
   @schema.sql

3. **Insert example data:**
   @insertion.sql
 
4. **Review and run example queries:**
   @queries.sql
 
5. **Install the stored procedure:**
   @procedure.sql


### Usage

- Use `Generate_Safe_Recipe` procedure to fetch safe ingredients and steps for recipes given allergen constraints.
- Explore and modify provided SQL queries for custom data retrieval.

## Future Work

- Expand the recipe and ingredient data used.
- Extend the schema to include user dietary profiles, nutrition info, and dietary tags.
- Implement automated allergen substitution logic in procedures.
- Integrate with web or chatbot frontends for live user interaction.





   
   
