import json

# Chemin vers le fichier GeoJSON
file_path = 'aaa.geojson'

# Lire le fichier GeoJSON et extraire les coordonnées
with open(file_path, 'r') as file:
    geojson_data = json.load(file)

# Extraire les coordonnées de l'itinéraire
coordinates = geojson_data['features'][0]['geometry']['coordinates']

# Format pour QML : [QtPositioning.coordinate(lat1, lon1), QtPositioning.coordinate(lat2, lon2), ...]
formatted_coordinates = [
    f"QtPositioning.coordinate({coord[1]}, {coord[0]})" for coord in coordinates
]

# Afficher les coordonnées formatées pour Qt
print(", ".join(formatted_coordinates))
