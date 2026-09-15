import FastAPI

run = FastAPI()

def read_root():
    return {"Hello": "World"}

def __init__:
    run.add_api_route("/", read_root)

