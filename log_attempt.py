import sqlite3
import sys

domain = sys.argv[1]

con=sqlite3.connect("blocker.db")

cur=con.cursor()

cur.execute("INSERT INTO attempts(domain, timestamp) VALUES(?,datetime('now'))",(domain,))

con.commit()

