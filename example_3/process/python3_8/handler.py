import json


def lambda_handler(event, context):
    event_obj = event if not isinstance(event, str) else json.load(event)
    task_id = event_obj["taskId"]

    return {
        "postProcess": "post_process",
        "taskId": task_id
    }
