import csv
from pprint import pprint
from facegraph import Graph
g = Graph("CAACEdEose0cBACwgvcBpIBgKGbS6QCasHRzxwi8ONKnNtFP4Mj14OtdyXpoYRn9fTsZB1tasvpy80XcEpPtILS4epJkX4NvVMlHVSSSskzn7dZBtrLIdXZASksZCyFrcuzbgFwgTZBFxNuFtTZBIGZAuVc5qzSzXsOZCxkHeqspUK0dKaKBko38OMWAT9sRkNZBzuhKy37dpNswZDZD")

for friend in g.me.friends().data:
	print ','.join([friend[k].encode('utf-8') for k in friend])