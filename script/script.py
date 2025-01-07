# import json

# # Chemin vers le fichier GeoJSON
# file_path = '3.geojson'

# # Lire le fichier GeoJSON et extraire les coordonnées
# with open(file_path, 'r') as file:
#     geojson_data = json.load(file)

# # Extraire les coordonnées de l'itinéraire
# coordinates = geojson_data['features'][0]['geometry']['coordinates']

# # Format pour QML : [QtPositioning.coordinate(lat1, lon1), QtPositioning.coordinate(lat2, lon2), ...]
# formatted_coordinates = [
#     f"QtPositioning.coordinate({coord[1]}, {coord[0]})" for coord in coordinates
# ]

# # Afficher les coordonnées formatées pour Qt
# print(", ".join(formatted_coordinates))


import json

# Fonction pour générer le QML depuis un fichier GeoJSON
def geojson_to_qml(geojson_path, car_id):
    with open(geojson_path, 'r') as file:
        geojson_data = json.load(file)
    
    # Extraire les coordonnées
    coordinates = geojson_data['features'][0]['geometry']['coordinates']
    
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
geojson_path = "2.geojson"  # Remplacez par votre fichier GeoJSON
car_id = 3  # ID unique pour la voiture
qml_block = geojson_to_qml(geojson_path, car_id)

# Sauvegarder le résultat ou l'afficher
print(qml_block)
