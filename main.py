from PySide2.QtCore import QObject, Slot
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtWidgets import QApplication
from utils.routing_api import ajouter_voiture  # Importer la fonction pour ajouter des voitures

class PyBridge(QObject):
    @Slot(list, list)
    def ajouterVoiture(self, coord_depart, coord_arrivee):
        global car_id
        car_id += 1  # Incrémenter l'ID de la voiture
        ajouter_voiture(coord_depart, coord_arrivee, car_id)

if __name__ == "__main__":
    app = QApplication([])
    engine = QQmlApplicationEngine()

    pyBridge = PyBridge()
    engine.rootContext().setContextProperty("pyBridge", pyBridge)

    engine.load("main.qml")
    app.exec_()
