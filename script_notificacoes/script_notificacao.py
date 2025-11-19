import time
import requests

while(True):
    print("enviando requisicao para notificacoes.php")
    response = requests.get("http://localhost:8000/notificacoes.php")
    print("Esperando 5 segundos")
    time.sleep(5000)