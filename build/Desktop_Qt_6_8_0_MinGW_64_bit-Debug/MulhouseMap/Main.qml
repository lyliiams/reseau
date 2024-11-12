import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtLocation 5.15
import QtPositioning 5.15

ApplicationWindow {
    id: appWindow
    visible: true
    width: 800
    height: 600
    title: "Carte de Mulhouse - OpenStreetMap"

    // Propriétés pour les coordonnées et le zoom initial
    property real initialZoom: 14
    property var initialCenter: QtPositioning.coordinate(47.750839, 7.335888)

    // Propriété pour ajuster la vitesse des animations
    property int animationSpeed: 1000  // Durée initiale pour chaque étape de l'animation en millisecondes


    // Itinéraires des voitures
    property var trajetVoiture: [
          QtPositioning.coordinate(47.749444, 7.336695),
          QtPositioning.coordinate(47.749535, 7.337116),
          QtPositioning.coordinate(47.749609, 7.337547),
          QtPositioning.coordinate(47.749619, 7.33775),
          QtPositioning.coordinate(47.749628, 7.338426),
          QtPositioning.coordinate(47.749589, 7.33874),
          QtPositioning.coordinate(47.749472, 7.339442),
          QtPositioning.coordinate(47.749314, 7.339851),
          QtPositioning.coordinate(47.749131, 7.34011),
          QtPositioning.coordinate(47.748773, 7.340659),
          QtPositioning.coordinate(47.74868, 7.3408),
          QtPositioning.coordinate(47.748285, 7.3414),
          QtPositioning.coordinate(47.747865, 7.341929),
          QtPositioning.coordinate(47.7478, 7.342026),
          QtPositioning.coordinate(47.747771, 7.342133),
          QtPositioning.coordinate(47.747661, 7.342159),
          QtPositioning.coordinate(47.747443, 7.34243),
          QtPositioning.coordinate(47.746984, 7.343011),
          QtPositioning.coordinate(47.746932, 7.343039),
          QtPositioning.coordinate(47.746841, 7.34323),
          QtPositioning.coordinate(47.746801, 7.343408),
          QtPositioning.coordinate(47.746813, 7.343541),
          QtPositioning.coordinate(47.746404, 7.343342),
          QtPositioning.coordinate(47.746378, 7.343262),
          QtPositioning.coordinate(47.746179, 7.34213),
          QtPositioning.coordinate(47.746127, 7.341816),
          QtPositioning.coordinate(47.746093, 7.341786),
          QtPositioning.coordinate(47.745951, 7.34174),
          QtPositioning.coordinate(47.745869, 7.341669),
          QtPositioning.coordinate(47.745805, 7.341552),
          QtPositioning.coordinate(47.745766, 7.341356),
          QtPositioning.coordinate(47.745779, 7.341169),
          QtPositioning.coordinate(47.74577, 7.341127),
          QtPositioning.coordinate(47.745037, 7.340602),
          QtPositioning.coordinate(47.74469, 7.340343),
          QtPositioning.coordinate(47.744554, 7.340231),
          QtPositioning.coordinate(47.744378, 7.339908),
          QtPositioning.coordinate(47.744343, 7.339842),
          QtPositioning.coordinate(47.744277, 7.339693),
          QtPositioning.coordinate(47.744232, 7.339591),
          QtPositioning.coordinate(47.74352, 7.338384),
          QtPositioning.coordinate(47.74323, 7.337999),
          QtPositioning.coordinate(47.74301, 7.338339),
          QtPositioning.coordinate(47.742751, 7.33874),
          QtPositioning.coordinate(47.74249, 7.339144),
          QtPositioning.coordinate(47.742428, 7.339186),
          QtPositioning.coordinate(47.742424, 7.339806),
          QtPositioning.coordinate(47.742436, 7.339932),
          QtPositioning.coordinate(47.742494, 7.340101),
          QtPositioning.coordinate(47.74262, 7.340354),
          QtPositioning.coordinate(47.742994, 7.34105)
      ]
    property var trajetVoiture2: [
        QtPositioning.coordinate(47.752839, 7.334888),
        QtPositioning.coordinate(47.753839, 7.334888),
        QtPositioning.coordinate(47.753839, 7.335888),
        QtPositioning.coordinate(47.752839, 7.335888)
    ]

    Map {
        id: map
        anchors.fill: parent
        plugin: Plugin {
            name: "osm"
        }

        center: appWindow.initialCenter
        zoomLevel: appWindow.initialZoom

        // Voiture 1
        MapQuickItem {
            id: voiture1
            coordinate: appWindow.trajetVoiture[0]
            anchorPoint.x: image.width / 2
            anchorPoint.y: image.height / 2
            sourceItem: Image {
                source: "car1.png"
                width: 32
                height: 32
            }

            // Animation pour déplacer la voiture le long du trajet
            SequentialAnimation on coordinate {
                loops: Animation.Infinite

                PropertyAnimation { to: appWindow.trajetVoiture[1]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[2]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[3]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[4]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[5]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[6]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[7]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[8]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[9]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[10]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[11]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[12]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[13]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[14]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[15]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[16]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[17]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[18]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[19]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[20]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[21]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[22]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[23]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[24]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[25]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[26]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[27]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[28]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[29]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[30]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[31]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[32]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[33]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[34]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[35]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[36]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[37]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[38]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[39]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[40]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[41]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[42]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[43]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[44]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[45]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[46]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[47]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[48]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[49]; duration: 1000 }
                PropertyAnimation { to: appWindow.trajetVoiture[50]; duration: 1000 }
            }

        }

        // Voiture 2
        MapQuickItem {
            id: voiture2
            coordinate: appWindow.trajetVoiture2[0]
            anchorPoint.x: image.width / 2
            anchorPoint.y: image.height / 2
            sourceItem: Image {
                source: "car2.png"
                width: 32
                height: 32
            }

            // Animation pour déplacer la voiture le long du trajet
            SequentialAnimation on coordinate {
                loops: Animation.Infinite
                PropertyAnimation { to: appWindow.trajetVoiture2[1]; duration: 3000 }
                PropertyAnimation { to: appWindow.trajetVoiture2[2]; duration: 3000 }
                PropertyAnimation { to: appWindow.trajetVoiture2[3]; duration: 3000 }
                PropertyAnimation { to: appWindow.trajetVoiture2[0]; duration: 3000 }
            }
        }
    }



    // Boutons de Zoom dans le coin supérieur droit
    Column {
        anchors.right: parent.right
        anchors.top: parent.top
        spacing: 10
        anchors.margins: 20

        Button {
            text: "+"
            font.pixelSize: 24
            width: 40
            height: 40
            background: Rectangle {
                color: "#4CAF50" // Vert moderne pour zoom avant
                radius: 20
            }
            onClicked: {
                if (map.zoomLevel < 20) {
                    map.zoomLevel += 1
                }
            }
        }

        Button {
            text: "-"
            font.pixelSize: 24
            width: 40
            height: 40
            background: Rectangle {
                color: "#F44336" // Rouge moderne pour zoom arrière
                radius: 20
            }
            onClicked: {
                if (map.zoomLevel > 1) {
                    map.zoomLevel -= 1
                }
            }
        }
    }

    // Conteneur de contrôle de direction avec bouton central de réinitialisation
    Rectangle {
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        width: 150
        height: 150
        radius: 75
        color: "#444444cc" // Fond semi-transparent pour le design moderne
        border.color: "#FFFFFF"
        border.width: 1

        // Bouton de Réinitialisation au centre
        Button {
            text: "⟳"
            font.pixelSize: 24
            anchors.centerIn: parent
            width: 50
            height: 50
            background: Rectangle {
                color: "#FFC107" // Jaune pour le bouton de réinitialisation
                radius: 25
            }
            onClicked: {
                map.center = initialCenter
                map.zoomLevel = initialZoom
            }
        }

        // Bouton pour Glisser vers le Haut
        Button {
            text: "↑"
            font.pixelSize: 18
            width: 40
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10
            background: Rectangle {
                color: "#2196F3" // Bleu moderne pour le déplacement
                radius: 20
            }
            onClicked: {
                map.center = QtPositioning.coordinate(map.center.latitude + 0.01, map.center.longitude)
            }
        }

        // Bouton pour Glisser vers le Bas
        Button {
            text: "↓"
            font.pixelSize: 18
            width: 40
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            background: Rectangle {
                color: "#2196F3"
                radius: 20
            }
            onClicked: {
                map.center = QtPositioning.coordinate(map.center.latitude - 0.01, map.center.longitude)
            }
        }

        // Bouton pour Glisser vers la Gauche
        Button {
            text: "←"
            font.pixelSize: 18
            width: 40
            height: 40
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
            background: Rectangle {
                color: "#2196F3"
                radius: 20
            }
            onClicked: {
                map.center = QtPositioning.coordinate(map.center.latitude, map.center.longitude - 0.01)
            }
        }

        // Bouton pour Glisser vers la Droite
        Button {
            text: "→"
            font.pixelSize: 18
            width: 40
            height: 40
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10
            background: Rectangle {
                color: "#2196F3"
                radius: 20
            }
            onClicked: {
                map.center = QtPositioning.coordinate(map.center.latitude, map.center.longitude + 0.01)
            }
        }

        // // Contrôles de vitesse
        // Column {
        //     anchors.right: parent.right
        //     anchors.bottom: parent.bottom
        //     spacing: 10
        //     anchors.margins: 20

        //     Button {
        //         text: "Accélérer"
        //         onClicked: {
        //             if (appWindow.animationSpeed > 100) {  // Limite minimale de la vitesse
        //                 appWindow.animationSpeed -= 100
        //             }
        //         }
        //     }

        //     Button {
        //         text: "Ralentir"
        //         onClicked: {
        //             appWindow.animationSpeed += 100  // Augmente la durée pour ralentir
        //         }
        //     }
        // }



    }
}
