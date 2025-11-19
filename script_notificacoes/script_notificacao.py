import time
import requests

while(True):
    response = requests.get("http://localhost:8000/notificacoes.php")
    time.sleep(5000)