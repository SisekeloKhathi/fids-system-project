from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from datetime import datetime

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

international_departures = [
    {"id": 1, "flight": "BA204", "location": "London (LHR)", "time": "10:45", "gate": "B7", "status": "Delayed"},
    {"id": 2, "flight": "EK765", "location": "Dubai (DXB)", "time": "13:20", "gate": "C3", "status": "On Time"},
    {"id": 3, "flight": "SQ321", "location": "Singapore (SIN)", "time": "15:10", "gate": "D9", "status": "On Time"},
]

domestic_departures = [
    {"id": 101, "flight": "SA101", "location": "Cape Town (CPT)", "time": "08:30", "gate": "A12", "status": "Boarding"},
    {"id": 102, "flight": "SA103", "location": "Durban (DUR)", "time": "09:45", "gate": "A14", "status": "On Time"},
]

international_arrivals = [
    {"id": 201, "flight": "BA203", "location": "London (LHR)", "time": "09:15", "gate": "B7", "status": "Arrived"},
    {"id": 202, "flight": "EK764", "location": "Dubai (DXB)", "time": "12:00", "gate": "C3", "status": "Landed"},
]

domestic_arrivals = [
    {"id": 301, "flight": "SA102", "location": "Cape Town (CPT)", "time": "10:15", "gate": "A12", "status": "Arrived"},
]

@app.get("/flights")
def get_flights():
    return {
        "updated": datetime.now().isoformat(),
        "international_departures": international_departures,
        "domestic_departures": domestic_departures,
        "international_arrivals": international_arrivals,
        "domestic_arrivals": domestic_arrivals
    }
