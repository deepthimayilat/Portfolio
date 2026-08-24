from fastapi import FastAPI
import json

app = FastAPI()

@app.get("/about")
def get_about():
    with open("data.json") as f:
        return json.load(f)
