import requests

API_KEY = "5b3ce3597851110001cf62489f0941ef3ef64457b73ef45e1afbc19c"
ROUTING_API_URL = "https://api.openrouteservice.org/v2/directions/driving-car"

def calculer_itineraire(coord_depart, coord_arrivee):
    headers = {
        "Authorization": API_KEY,
        "Content-Type": "application/json",
    }
    data = {"coordinates": [coord_depart, coord_arrivee]}
    response = requests.post(ROUTING_API_URL, headers=headers, json=data)
    if response.status_code == 200:
        return response.json()["features"][0]["geometry"]["coordinates"]
    return None

def generer_qml_pour_voiture(coordonnees, car_id):
    formatted_coordinates = [
        f"QtPositioning.coordinate({coord[1]}, {coord[0]})" for coord in coordonnees
    ]
    qml_code = f"""
    property var trajetVoiture{car_id}: [
        {", ".join(formatted_coordinates)}
    ]

    MapQuickItem {{
        id: voiture{car_id}
        coordinate: trajetVoiture{car_id}[0]
        anchorPoint.x: 16
        anchorPoint.y: 16
        sourceItem: Image {{
            source: "car{car_id}.png"
            width: 32
            height: 32
        }}

        SequentialAnimation on coordinate {{
            loops: Animation.Infinite
            {"".join([f'PropertyAnimation {{ to: trajetVoiture{car_id}[{i+1}]; duration: 500 }}' for i in range(len(coordonnees) - 1)])}
        }}
    }}
    """
    return qml_code

def ajouter_voiture(coord_depart, coord_arrivee, car_id):
    itineraire = calculer_itineraire(coord_depart, coord_arrivee)
    if itineraire:
        qml_code = generer_qml_pour_voiture(itineraire, car_id)
        with open(f"generated_qml/voiture_{car_id}.qml", "w") as fichier:
            fichier.write(qml_code)
