from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
from random import random, randint , choice
import psycopg2
import random
from datetime import date, timedelta

DATABASE_NAME = 'assignment1'
SALES_REGION_TABLE = 'sales_region'
LONDON_TABLE = 'london'
SYDNEY_TABLE = 'sydney'
BOSTON_TABLE = 'boston'
SALES_TABLE = 'sales'
SALES_2020_TABLE = 'sales_2020'
SALES_2021_TABLE = 'sales_2021'
SALES_2022_TABLE = 'sales_2022'
REGIONS = ["Boston", "Sydney", "London"]
PRODUCT_NAMES = ["Product_A", "Product_B", "Product_C", "Product_D", "Product_E"]


def create_database(dbname):
        conn_string = "host='localhost' dbname='postgres' user='postgres' password='akhila123'"
        conn = psycopg2.connect(conn_string)
        conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
        cursor = conn.cursor()
        sqlCreateDatabase = f"CREATE DATABASE {dbname};"
        cursor.execute(sqlCreateDatabase)
        print("Database has been created successfully!")
        conn.close()

        
def connect_potsgres(dbname):
    conn_string = f"host='localhost' dbname={dbname} user='postgres' password='akhila123'"
    conn = psycopg2.connect(conn_string)
    return conn


def list_partitioning(conn):
    cursor = conn.cursor()
    cursor.execute(f"""
            CREATE TABLE public.{SALES_REGION_TABLE} (
                id SERIAL,
                amount INT,
                region VARCHAR(255)
            ) PARTITION BY LIST (region);
        """)

    conn.commit()
       
    for region in REGIONS:
        cursor.execute(f"""
                CREATE TABLE public.{region.lower()} PARTITION OF public.{SALES_REGION_TABLE}
                FOR VALUES IN ('{region}');
            """)
        conn.commit()
        print(f"Partition '{region.lower()}' created.")

    print("Partition done!")


def insert_list_data(conn):
    cursor = conn.cursor()
    for i in range(1, 51):  
        amount = random.randint(100, 1000)  
        region = random.choice(REGIONS)  
        cursor.execute("""
                INSERT INTO sales_region (id, amount, region)
                VALUES (%s, %s, %s);
            """, (i, amount, region))
    conn.commit()
    print("Data inserted successfully into 'sales_region' table.")

def select_list_data(conn):
    
    cursor = conn.cursor()

        # Select data from the sales_region table
    cursor.execute(f"SELECT * FROM {SALES_REGION_TABLE};")
    sales_region_data = cursor.fetchall()
    print("Data from 'sales_region' table:")
    for row in sales_region_data:
        print(row)

        # Select data from the Boston table
    cursor.execute(f"SELECT * FROM {BOSTON_TABLE};")
    boston_data = cursor.fetchall()
    print("\nData from 'boston' table:")
    for row in boston_data:
        print(row)

        # Select data from the London table
    cursor.execute(f"SELECT * FROM {LONDON_TABLE};")
    london_data = cursor.fetchall()
    print("\nData from 'london' table:")
    for row in london_data:
        print(row)

        # Select data from the Sydney table
    cursor.execute(f"SELECT * FROM {SYDNEY_TABLE};")
    sydney_data = cursor.fetchall()
    print("\nData from 'sydney' table:")
    for row in sydney_data:
        print(row)
        
        
def range_partitioning(conn):
    cursor = conn.cursor()
    cursor.execute(f"""
            CREATE TABLE public.{SALES_TABLE} (
                id SERIAL,
                product_name TEXT,
                amount INT,
                sale_date DATE
            ) PARTITION BY RANGE (sale_date);
        """)

    conn.commit()
    print(f"Table '{SALES_TABLE}' has been created successfully with range partitioning.")
        
    for year in range(2020, 2023):
        cursor.execute(f"""
                CREATE TABLE public.{SALES_TABLE}_{year} PARTITION OF public.{SALES_TABLE}
                FOR VALUES FROM ('{year}-01-01') TO ('{year}-12-31');
            """)
        conn.commit()
        print(f"Partition '{SALES_TABLE}_{year}' created.") 

    print("Range partitioning done!")

    
def insert_range_data(conn):
   
        cursor = conn.cursor()
        start_date = date(2020, 1, 1)
        end_date = date(2022, 12, 31)

        for i in range(1, 51):  
            product_name = choice(PRODUCT_NAMES)  
            amount = randint(1, 100)  
            sale_date = start_date + timedelta(days=randint(0, (end_date - start_date).days))  

            cursor.execute("""
                INSERT INTO sales (id, product_name, amount, sale_date)
                VALUES (%s, %s, %s, %s);
            """, (i, product_name, amount, sale_date))

        conn.commit()
        

def select_range_data(conn):
        cursor = conn.cursor()

        # Select data from the sales table
        cursor.execute(f"SELECT * FROM {SALES_TABLE};")
        sales_data = cursor.fetchall()
        print("Data from 'sales' table:")
        for row in sales_data:
            print(row)

        # Select data from the sales_2020 table
        cursor.execute(f"SELECT * FROM {SALES_2020_TABLE};")
        sales_2020_data = cursor.fetchall()
        print("\nData from 'sales_2020' table:")
        for row in sales_2020_data:
            print(row)

        # Select data from the sales_2021 table
        cursor.execute(f"SELECT * FROM {SALES_2021_TABLE};")
        sales_2021_data = cursor.fetchall()
        print("\nData from 'sales_2021' table:")
        for row in sales_2021_data:
            print(row)

        # Select data from the sales_2022 table
        cursor.execute(f"SELECT * FROM {SALES_2022_TABLE};")
        sales_2022_data = cursor.fetchall()
        print("\nData from 'sales_2022' table:")
        for row in sales_2022_data:
            print(row)
    

if __name__ == '__main__':

    create_database(DATABASE_NAME)

    with connect_potsgres(dbname=DATABASE_NAME) as conn:
        conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)

        list_partitioning(conn)
        insert_list_data(conn)
        select_list_data(conn)

        range_partitioning(conn)
        insert_range_data(conn)
        select_range_data(conn)

        print('Done')
