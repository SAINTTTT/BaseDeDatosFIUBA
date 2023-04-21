import requests
import json

response = requests.get(url='http://google.com?')
print(json.dump(response.json))