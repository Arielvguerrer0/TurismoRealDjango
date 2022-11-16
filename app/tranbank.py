import requests
import json

def crearTransaction():
    url = "https://webpay3gint.transbank.cl/rswebpaytransaction/api/webpay/v1.2/transactions"

    payload = json.dumps({
    "buy_order": "ordenCompra12345678",
    "session_id": "sesion1234557545",
    "amount": 10000,
    "return_url": "http://www.comercio.cl/webpay/retorno"
    })
    headers = {
    'Tbk-Api-Key-Id': '597055555532',
    'Tbk-Api-Key-Secret': '579B532A7440BB0C9079DED94D31EA1615BACEB56610332264630D42D0A36B1C',
    'Content-Type': 'application/json'
    }

    response = requests.request("POST", url, headers=headers, data=payload)

    return(response.json())