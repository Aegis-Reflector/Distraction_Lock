import sqlite3

con=sqlite3.connect("blocker.db")

cur=con.cursor()

cur.execute("select count(*) from attempts")

res1 = cur.fetchone()

print (f'Total attempts :{res1[0]}')

cur.execute("select domain,count (*) from attempts group by domain order by count(*) DESC limit 5")
 

res=cur.fetchall()

for row in res:		print(f"{row[0]:<20} {row[1]}")


