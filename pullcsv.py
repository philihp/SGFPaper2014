import csv
from pprint import pprint
from facegraph import Graph
g = Graph("CAACEdEose0cBAHvVpccHBFrBCazQvuzZCAlK3ZCAD3nHfaq8ZAD6neU779otMGfngaE5UAeGYE9ApbD6gYvcLjm4cL68CMqLwweNgJph996MZBHJLHzWgRgZBxyy41UE8PTBCjwkAGz6BAi56jP2gZAclXPeDiynOchq3X3QZCzLThSpfds84UA9HfiZCDOGtY3LnPXxq4EJjgZDZD")

for friend in g.me.friends().data:
	print ','.join([friend[k].encode('utf-8') for k in friend])