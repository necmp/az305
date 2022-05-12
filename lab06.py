import os
from azure.servicebus import ServiceBusClient,ServiceBusMessage

client = ServiceBusClient.from_connection_string(conn_str="<接続文字列>")
sender = client.get_queue_sender(queue_name="<キュー名>")
message = ServiceBusMessage("Hello World!!")
sender.send_messages(message)

receiver = client.get_queue_receiver(queue_name="<キュー名>", max_wait_time=3)
for msg in receiver:
            print(str(msg))
            receiver.complete_message(msg)