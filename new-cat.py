import requests
import json
import time

while True:
	response = requests.get("https://api.thecatapi.com/v1/images/search")
	if (response.status_code != 200):
		raise Exception("request failed")
	data = response.json()
	print(json.dumps(response.json(), indent=4))
	print(data)
	url = data[0]["url"]
	response = requests.get(url)
	with open('img.png', 'wb') as f:
		f.write(response.content)
	time.sleep(2)