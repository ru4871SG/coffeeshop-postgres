"""
Import JSON files into PostgreSQL database using SQLAlchemy
"""

import os
import pandas as pd
from sqlalchemy import create_engine

from dotenv import load_dotenv

load_dotenv()

db_name = os.environ.get("DB_NAME")
db_user = os.environ.get("DB_USER")
db_password = os.environ.get("DB_PASSWORD")
db_host = os.environ.get("DB_HOST")
db_port = os.environ.get("DB_PORT")

# Connect to PostgreSQL database
engine = create_engine(f"postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}")

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
df_customer.to_sql('customer', engine, if_exists='replace', index=False)
df_product.to_sql('product', engine, if_exists='replace', index=False)
df_product_description.to_sql('product_description', engine, if_exists='replace', index=False)
df_product_type.to_sql('product_type', engine, if_exists='replace', index=False)
df_sales_detail.to_sql('sales_detail', engine, if_exists='replace', index=False)
df_sales_outlet.to_sql('sales_outlet', engine, if_exists='replace', index=False)
df_sales_transaction.to_sql('sales_transaction', engine, if_exists='replace', index=False)
df_staff.to_sql('staff', engine, if_exists='replace', index=False)
