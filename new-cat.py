import requests
import json
import urllib.request
import time

while True:
	response = requests.get("https://api.thecatapi.com/v1/images/search")
	if (response.status_code != 200):
		raise Exception("request failed")
	data = response.json()
	print(json.dumps(response.json(), indent=4))
	print(data)
	urllib.request.urlretrieve(data[0]["url"], "img.png")
	time.sleep(2)