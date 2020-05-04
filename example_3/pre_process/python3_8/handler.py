import json


def lambda_handler(event, context):
    event_obj = event if not isinstance(event, str) else json.load(event)
    task_id = event_obj["taskId"]

    if task_id == 123:
        raise Exception("Was a number")

    return {
        "process": "process",
        "taskId": task_id
    }
