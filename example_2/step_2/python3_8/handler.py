import json


def lambda_handler(event, context):
    event_obj = event if not isinstance(event, str) else json.load(event)

    return {
        "Step 2 Value": "Yay?",
        "Input": event_obj["Input"]
    }
