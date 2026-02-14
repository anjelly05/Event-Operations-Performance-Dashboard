import sqlite3
import pandas as pd

# Load enriched dataset
df = pd.read_csv("data/event_operations_enriched.csv")

# Connect to SQLite
conn = sqlite3.connect("event_operations.db")

# Write to SQL table
df.to_sql("events", conn, if_exists="replace", index=False)

conn.close()

print("Data successfully loaded into SQLite.")
