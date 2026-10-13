import sqlite3
con = sqlite3.connect("blocker.db")

cur=con.cursor()

cur.execute("CREATE TABLE attempts(id INTEGER PRIMARY KEY,domaine TEXT,timestamp TEXT)" )

cur.execute("INSERT INTO attempts VALUES('1,Chimera Shadow Garden,10:17')")

con.commit()

con.close()
