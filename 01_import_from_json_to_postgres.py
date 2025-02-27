"""
Import JSON files into PostgreSQL database using SQLAlchemy
"""

import os
import pandas as pd
from sqlalchemy import create_engine, text

from dotenv import load_dotenv

load_dotenv()

db_name = os.environ.get("DB_NAME")
db_user = os.environ.get("DB_USER")
db_password = os.environ.get("DB_PASSWORD")
db_host = os.environ.get("DB_HOST")
db_port = os.environ.get("DB_PORT")

# Check if all environment variables are present
if not all([db_name, db_user, db_password, db_host, db_port]):
    print("Error: Missing environment variables. Check your .env file.")
    print(f"DB_NAME: {db_name}")
    print(f"DB_USER: {db_user}")
    print(f"DB_PASSWORD: {'*****' if db_password else None}")
    print(f"DB_HOST: {db_host}")
    print(f"DB_PORT: {db_port}")
    exit(1)

# Connect to PostgreSQL database
connection_string = f"postgresql+psycopg2://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}"
print(f"Connecting to: postgresql+psycopg2://{db_user}:****@{db_host}:{db_port}/{db_name}")

try:
    engine = create_engine(connection_string)
    
    # Test connection
    with engine.connect() as conn:
        print("Successfully connected to the database!")
        
    # Create Pandas DataFrames from JSON files
    df_customer = pd.read_json('starting_json/customer.json', orient='records')
    df_product = pd.read_json('starting_json/product.json', orient='records')
    df_product_description = pd.read_json('starting_json/product_description.json', orient='records')
    df_product_type = pd.read_json('starting_json/product_type.json', orient='records')
    df_sales_detail = pd.read_json('starting_json/sales_detail.json', orient='records')
    df_sales_outlet = pd.read_json('starting_json/sales_outlet.json', orient='records')
    df_sales_transaction = pd.read_json('starting_json/sales_transaction.json', orient='records')
    df_staff = pd.read_json('starting_json/staff.json', orient='records')

    # Write DataFrames to PostgreSQL tables
    with engine.begin() as conn:
        df_customer.to_sql('customer', conn, if_exists='replace', index=False)
        df_product.to_sql('product', conn, if_exists='replace', index=False)
        df_product_description.to_sql('product_description', conn, if_exists='replace', index=False)
        df_product_type.to_sql('product_type', conn, if_exists='replace', index=False)
        df_sales_detail.to_sql('sales_detail', conn, if_exists='replace', index=False)
        df_sales_outlet.to_sql('sales_outlet', conn, if_exists='replace', index=False)
        df_sales_transaction.to_sql('sales_transaction', conn, if_exists='replace', index=False)
        df_staff.to_sql('staff', conn, if_exists='replace', index=False)
    
    print("All tables imported successfully!")
    
except Exception as e:
    print(f"Error: {e}")
    exit(1)
