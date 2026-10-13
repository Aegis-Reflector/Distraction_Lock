import sqlite3
con = sqlite3.connect("blocker.db")

cur=con.cursor()

cur.execute("CREATE TABLE attempts(id INTEGER PRIMARY KEY,domain TEXT,timestamp TEXT)" )

con.commit()

con.close()
