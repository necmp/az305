import os
from azure.keyvault.secrets import SecretClient
from azure.identity import DefaultAzureCredential

KVUri = f"https://<キーコンテナ名>.vault.azure.net"

credential = DefaultAzureCredential()
client = SecretClient(vault_url=KVUri, credential=credential)

retrieved_secret = client.get_secret("name")
print(f"Your name is '{retrieved_secret.value}'.")