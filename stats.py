import sqlite3

con=sqlite3.connect("blocker.db")

cur=con.cursor()

cur.execute("select count(*) from attempts")

res1 = cur.fetchone()

print (f'Total attempts :{res1}')

cur.execute("select domain from attempts group by count(domain) order by count(*) DESC limit 5")
 

res=cur.fetchall()

print(res)

