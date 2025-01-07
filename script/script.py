# # import json

# # # Chemin vers le fichier GeoJSON
# # file_path = '3.geojson'

# # # Lire le fichier GeoJSON et extraire les coordonnées
# # with open(file_path, 'r') as file:
# #     geojson_data = json.load(file)

# # # Extraire les coordonnées de l'itinéraire
# # coordinates = geojson_data['features'][0]['geometry']['coordinates']

# # # Format pour QML : [QtPositioning.coordinate(lat1, lon1), QtPositioning.coordinate(lat2, lon2), ...]
# # formatted_coordinates = [
# #     f"QtPositioning.coordinate({coord[1]}, {coord[0]})" for coord in coordinates
# # ]

# # # Afficher les coordonnées formatées pour Qt
# # print(", ".join(formatted_coordinates))


# import json

# # Fonction pour générer le QML depuis un fichier GeoJSON
# def geojson_to_qml(geojson_path, car_id):
#     with open(geojson_path, 'r') as file:
#         geojson_data = json.load(file)
    
#     # Extraire les coordonnées
#     coordinates = geojson_data['features'][0]['geometry']['coordinates']
    
#     # Formater les coordonnées en QML
#     formatted_coordinates = [
#         f"QtPositioning.coordinate({coord[1]}, {coord[0]})" for coord in coordinates
#     ]
    
#     # Générer le bloc QML pour l'itinéraire et l'animation
#     qml_code = f"""
#     property var trajetVoiture{car_id}: [
#         {", ".join(formatted_coordinates)}
#     ]

#     MapQuickItem {{
#         id: voiture{car_id}
#         coordinate: trajetVoiture{car_id}[0]
#         anchorPoint.x: 16
#         anchorPoint.y: 16
#         sourceItem: Image {{
#             source: "car{car_id}.png"
#             width: 32
#             height: 32
#         }}

#         SequentialAnimation on coordinate {{
#             loops: Animation.Infinite
#             {"".join([f'PropertyAnimation {{ to: trajetVoiture{car_id}[{i+1}]; duration: 500 }}' for i in range(len(coordinates) - 1)])}
#         }}
#     }}
#     """
#     return qml_code


# # Exemple d'utilisation
# geojson_path = "2.geojson"  # Remplacez par votre fichier GeoJSON
# car_id = 3  # ID unique pour la voiture
# qml_block = geojson_to_qml(geojson_path, car_id)

# # Sauvegarder le résultat ou l'afficher
# print(qml_block)



import requests
import json

# Fonction pour récupérer un itinéraire depuis l'API
def get_route_from_api(api_key, start_coords, end_coords):
    url = f"https://api.openrouteservice.org/v2/directions/driving-car"
    params = {
        "api_key": api_key,
        "start": f"{start_coords[1]},{start_coords[0]}",  # lon, lat
        "end": f"{end_coords[1]},{end_coords[0]}"        # lon, lat
    }
    response = requests.get(url, params=params)
    if response.status_code == 200:
        return response.json()
    else:
        raise Exception(f"API request failed: {response.status_code} {response.text}")

# Fonction pour convertir la réponse de l'API en QML
def api_response_to_qml(api_response, car_id):
    # Extraire les coordonnées de l'itinéraire
    coordinates = api_response['features'][0]['geometry']['coordinates']
    
    # Formater les coordonnées en QML
    formatted_coordinates = [
        f"QtPositioning.coordinate({coord[1]}, {coord[0]})" for coord in coordinates
    ]
    
    # Générer le bloc QML pour l'itinéraire et l'animation
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
            {"".join([f'PropertyAnimation {{ to: trajetVoiture{car_id}[{i+1}]; duration: 500 }}' for i in range(len(coordinates) - 1)])}
        }}
    }}
    """
    return qml_code

# Exemple d'utilisation
if __name__ == "__main__":
    # Votre clé API OpenRouteService
    api_key = "5b3ce3597851110001cf62489f0941ef3ef64457b73ef45e1afbc19cs"
    
    # Coordonnées de départ et d'arrivée (lat, lon)
    start_coords = (8.681495,49.41461)  # Exemple : Mulhouse
    end_coords = (8.687872,49.420318)     # Exemple : Autre point

    try:
        # Obtenir les données de l'itinéraire via l'API
        api_response = get_route_from_api(api_key, start_coords, end_coords)
        
        # Générer le QML pour une voiture (ID = 1)
        car_id = 1
        qml_block = api_response_to_qml(api_response, car_id)
        
        # Afficher ou sauvegarder le QML généré
        print(qml_block)
    except Exception as e:
        print(f"Erreur: {e}")
