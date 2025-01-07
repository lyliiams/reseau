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

    // Propriété pour ajuster la sensibilité du glissement
    property real panSensitivity: 0.005 // Ajustez pour des déplacements plus petits ou plus grands

    // Déclaration des animations ici pour qu'elles soient accessibles par les boutons
    NumberAnimation {
        id: panAnimationX
        target: map
        property: "center.longitude"
        duration: 200 // Ajustez la durée pour un mouvement plus ou moins rapide
    }
    NumberAnimation {
            id: panAnimationY
            target: map
            property: "center.latitude"
            duration: 200
        }

    property var carColors: ["red", "blue", "green"] // Couleurs des voitures



    // Itinéraire de la voiture
    property var trajetVoiture1: [
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
            QtPositioning.coordinate(47.733678, 7.315242), QtPositioning.coordinate(47.733768, 7.315765), QtPositioning.coordinate(47.733763, 7.315935), QtPositioning.coordinate(47.733816, 7.316185), QtPositioning.coordinate(47.733831, 7.316373), QtPositioning.coordinate(47.733789, 7.316455), QtPositioning.coordinate(47.733766, 7.316602), QtPositioning.coordinate(47.733777, 7.316703), QtPositioning.coordinate(47.73382, 7.31681), QtPositioning.coordinate(47.733887, 7.316884), QtPositioning.coordinate(47.73392, 7.316904), QtPositioning.coordinate(47.734002, 7.316909), QtPositioning.coordinate(47.734071, 7.316881), QtPositioning.coordinate(47.734206, 7.316976), QtPositioning.coordinate(47.734299, 7.317083), QtPositioning.coordinate(47.734366, 7.3171), QtPositioning.coordinate(47.734666, 7.317462), QtPositioning.coordinate(47.734811, 7.317606), QtPositioning.coordinate(47.735002, 7.31776), QtPositioning.coordinate(47.735405, 7.318016), QtPositioning.coordinate(47.735816, 7.318225), QtPositioning.coordinate(47.735874, 7.318309), QtPositioning.coordinate(47.736274, 7.318528), QtPositioning.coordinate(47.736307, 7.318551), QtPositioning.coordinate(47.736668, 7.318747), QtPositioning.coordinate(47.736929, 7.318854), QtPositioning.coordinate(47.737001, 7.318848), QtPositioning.coordinate(47.737045, 7.318867), QtPositioning.coordinate(47.738272, 7.319502), QtPositioning.coordinate(47.738453, 7.319597), QtPositioning.coordinate(47.739895, 7.32036), QtPositioning.coordinate(47.740178, 7.32063), QtPositioning.coordinate(47.74022, 7.320701), QtPositioning.coordinate(47.740231, 7.320751), QtPositioning.coordinate(47.740302, 7.320866), QtPositioning.coordinate(47.740406, 7.320889), QtPositioning.coordinate(47.740487, 7.321004), QtPositioning.coordinate(47.740658, 7.321165), QtPositioning.coordinate(47.741402, 7.322099), QtPositioning.coordinate(47.741711, 7.322522), QtPositioning.coordinate(47.741864, 7.322792), QtPositioning.coordinate(47.742233, 7.323548), QtPositioning.coordinate(47.742372, 7.323884), QtPositioning.coordinate(47.742935, 7.324806), QtPositioning.coordinate(47.74302, 7.324912), QtPositioning.coordinate(47.743135, 7.324993), QtPositioning.coordinate(47.743822, 7.326033), QtPositioning.coordinate(47.743948, 7.326212), QtPositioning.coordinate(47.74396, 7.326229), QtPositioning.coordinate(47.744184, 7.326577), QtPositioning.coordinate(47.744337, 7.326793), QtPositioning.coordinate(47.744748, 7.327403), QtPositioning.coordinate(47.74488, 7.327713), QtPositioning.coordinate(47.744951, 7.327982), QtPositioning.coordinate(47.745358, 7.329285), QtPositioning.coordinate(47.745452, 7.329506), QtPositioning.coordinate(47.745585, 7.329751), QtPositioning.coordinate(47.745727, 7.329938), QtPositioning.coordinate(47.746073, 7.330447), QtPositioning.coordinate(47.746528, 7.331213), QtPositioning.coordinate(47.747024, 7.331963), QtPositioning.coordinate(47.747063, 7.332026)
        ]
    property var trajetVoiture3: [
        QtPositioning.coordinate(47.746536, 7.331952), QtPositioning.coordinate(47.746291, 7.331554), QtPositioning.coordinate(47.746528, 7.331213), QtPositioning.coordinate(47.747024, 7.331963), QtPositioning.coordinate(47.747265, 7.332352), QtPositioning.coordinate(47.747292, 7.332419), QtPositioning.coordinate(47.747225, 7.332453), QtPositioning.coordinate(47.746965, 7.332753), QtPositioning.coordinate(47.746833, 7.332961), QtPositioning.coordinate(47.74679, 7.3331), QtPositioning.coordinate(47.746706, 7.333579), QtPositioning.coordinate(47.746461, 7.333574), QtPositioning.coordinate(47.746189, 7.333486), QtPositioning.coordinate(47.74603, 7.333375), QtPositioning.coordinate(47.745818, 7.33331), QtPositioning.coordinate(47.745663, 7.333287), QtPositioning.coordinate(47.745468, 7.333391), QtPositioning.coordinate(47.745411, 7.333445), QtPositioning.coordinate(47.745097, 7.33422), QtPositioning.coordinate(47.744932, 7.334625), QtPositioning.coordinate(47.744704, 7.335193), QtPositioning.coordinate(47.744663, 7.335344), QtPositioning.coordinate(47.744586, 7.335521), QtPositioning.coordinate(47.744542, 7.335636), QtPositioning.coordinate(47.744347, 7.335977), QtPositioning.coordinate(47.744072, 7.33551), QtPositioning.coordinate(47.743369, 7.336639), QtPositioning.coordinate(47.743356, 7.336769), QtPositioning.coordinate(47.743373, 7.336896), QtPositioning.coordinate(47.74341, 7.336993), QtPositioning.coordinate(47.742976, 7.337667), QtPositioning.coordinate(47.742494, 7.337085), QtPositioning.coordinate(47.742435, 7.336972), QtPositioning.coordinate(47.742448, 7.336923), QtPositioning.coordinate(47.742441, 7.33682), QtPositioning.coordinate(47.742421, 7.336776), QtPositioning.coordinate(47.742359, 7.336728), QtPositioning.coordinate(47.742317, 7.336731), QtPositioning.coordinate(47.742265, 7.336775), QtPositioning.coordinate(47.742236, 7.336853), QtPositioning.coordinate(47.742239, 7.336942), QtPositioning.coordinate(47.742283, 7.337024), QtPositioning.coordinate(47.742351, 7.33705), QtPositioning.coordinate(47.742416, 7.337293), QtPositioning.coordinate(47.742422, 7.338181), QtPositioning.coordinate(47.742428, 7.339186), QtPositioning.coordinate(47.742424, 7.339806), QtPositioning.coordinate(47.742436, 7.339932), QtPositioning.coordinate(47.742494, 7.340101), QtPositioning.coordinate(47.74262, 7.340354), QtPositioning.coordinate(47.742994, 7.34105)]


    Map {
        id: map
        anchors.fill: parent
        plugin: Plugin { name: "osm" }

        center: appWindow.initialCenter
        zoomLevel: appWindow.initialZoom

        // Permettre le glissement de la carte avec la souris
        MouseArea {
            anchors.fill: parent
            drag.target: map
        }

        // Voiture
        MapQuickItem {
            id: voiture1
            coordinate: appWindow.trajetVoiture1[0]
            anchorPoint.x: 16
            anchorPoint.y: 16
            sourceItem: Image {
                source: "car1.png"
                width: 32
                height: 32
            }

            SequentialAnimation on coordinate {
                loops: Animation.Infinite
                PropertyAnimation { to: appWindow.trajetVoiture1[1]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[2]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[3]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[4]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[5]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[6]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[7]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[8]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[9]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[10]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[11]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[12]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[13]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[14]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[15]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[16]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[17]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[18]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[19]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[20]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[21]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[22]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[23]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[24]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[25]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[26]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[27]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[28]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[29]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[30]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[31]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[32]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[33]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[34]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[35]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[36]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[37]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[38]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[39]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[40]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[41]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[42]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[43]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[44]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[45]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[46]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[47]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[48]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[49]; duration: 500 }
                                                PropertyAnimation { to: appWindow.trajetVoiture1[50]; duration: 500 }
            }
        }



            MapQuickItem {
                id: voiture2
                coordinate: trajetVoiture2[0]
                anchorPoint.x: 16
                anchorPoint.y: 16
                sourceItem: Image {
                    source: "car2.png"
                    width: 32
                    height: 32
                }

                SequentialAnimation on coordinate {
                    loops: Animation.Infinite
                    PropertyAnimation { to: trajetVoiture2[1]; duration: 500 }PropertyAnimation { to: trajetVoiture2[2]; duration: 500 }PropertyAnimation { to: trajetVoiture2[3]; duration: 500 }PropertyAnimation { to: trajetVoiture2[4]; duration: 500 }PropertyAnimation { to: trajetVoiture2[5]; duration: 500 }PropertyAnimation { to: trajetVoiture2[6]; duration: 500 }PropertyAnimation { to: trajetVoiture2[7]; duration: 500 }PropertyAnimation { to: trajetVoiture2[8]; duration: 500 }PropertyAnimation { to: trajetVoiture2[9]; duration: 500 }PropertyAnimation { to: trajetVoiture2[10]; duration: 500 }PropertyAnimation { to: trajetVoiture2[11]; duration: 500 }PropertyAnimation { to: trajetVoiture2[12]; duration: 500 }PropertyAnimation { to: trajetVoiture2[13]; duration: 500 }PropertyAnimation { to: trajetVoiture2[14]; duration: 500 }PropertyAnimation { to: trajetVoiture2[15]; duration: 500 }PropertyAnimation { to: trajetVoiture2[16]; duration: 500 }PropertyAnimation { to: trajetVoiture2[17]; duration: 500 }PropertyAnimation { to: trajetVoiture2[18]; duration: 500 }PropertyAnimation { to: trajetVoiture2[19]; duration: 500 }PropertyAnimation { to: trajetVoiture2[20]; duration: 500 }PropertyAnimation { to: trajetVoiture2[21]; duration: 500 }PropertyAnimation { to: trajetVoiture2[22]; duration: 500 }PropertyAnimation { to: trajetVoiture2[23]; duration: 500 }PropertyAnimation { to: trajetVoiture2[24]; duration: 500 }PropertyAnimation { to: trajetVoiture2[25]; duration: 500 }PropertyAnimation { to: trajetVoiture2[26]; duration: 500 }PropertyAnimation { to: trajetVoiture2[27]; duration: 500 }PropertyAnimation { to: trajetVoiture2[28]; duration: 500 }PropertyAnimation { to: trajetVoiture2[29]; duration: 500 }PropertyAnimation { to: trajetVoiture2[30]; duration: 500 }PropertyAnimation { to: trajetVoiture2[31]; duration: 500 }PropertyAnimation { to: trajetVoiture2[32]; duration: 500 }PropertyAnimation { to: trajetVoiture2[33]; duration: 500 }PropertyAnimation { to: trajetVoiture2[34]; duration: 500 }PropertyAnimation { to: trajetVoiture2[35]; duration: 500 }PropertyAnimation { to: trajetVoiture2[36]; duration: 500 }PropertyAnimation { to: trajetVoiture2[37]; duration: 500 }PropertyAnimation { to: trajetVoiture2[38]; duration: 500 }PropertyAnimation { to: trajetVoiture2[39]; duration: 500 }PropertyAnimation { to: trajetVoiture2[40]; duration: 500 }PropertyAnimation { to: trajetVoiture2[41]; duration: 500 }PropertyAnimation { to: trajetVoiture2[42]; duration: 500 }PropertyAnimation { to: trajetVoiture2[43]; duration: 500 }PropertyAnimation { to: trajetVoiture2[44]; duration: 500 }PropertyAnimation { to: trajetVoiture2[45]; duration: 500 }PropertyAnimation { to: trajetVoiture2[46]; duration: 500 }PropertyAnimation { to: trajetVoiture2[47]; duration: 500 }PropertyAnimation { to: trajetVoiture2[48]; duration: 500 }PropertyAnimation { to: trajetVoiture2[49]; duration: 500 }PropertyAnimation { to: trajetVoiture2[50]; duration: 500 }PropertyAnimation { to: trajetVoiture2[51]; duration: 500 }PropertyAnimation { to: trajetVoiture2[52]; duration: 500 }PropertyAnimation { to: trajetVoiture2[53]; duration: 500 }PropertyAnimation { to: trajetVoiture2[54]; duration: 500 }PropertyAnimation { to: trajetVoiture2[55]; duration: 500 }PropertyAnimation { to: trajetVoiture2[56]; duration: 500 }PropertyAnimation { to: trajetVoiture2[57]; duration: 500 }PropertyAnimation { to: trajetVoiture2[58]; duration: 500 }PropertyAnimation { to: trajetVoiture2[59]; duration: 500 }PropertyAnimation { to: trajetVoiture2[60]; duration: 500 }PropertyAnimation { to: trajetVoiture2[61]; duration: 500 }
                }
            }




        MapQuickItem {
            id: voiture3
            coordinate: appWindow.trajetVoiture3[0] // Ajout de "appWindow"
            anchorPoint.x: 16
            anchorPoint.y: 16
            sourceItem: Image {
                source: "car2.png"
                width: 32
                height: 32
            }

            SequentialAnimation on coordinate {
                loops: Animation.Infinite
                // Ajout de "appWindow" pour chaque référence à "trajetVoiture3"
                PropertyAnimation { to: appWindow.trajetVoiture3[1]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[2]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[3]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[4]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[5]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[6]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[7]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[8]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[9]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[10]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[11]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[12]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[13]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[14]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[15]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[16]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[17]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[18]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[19]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[20]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[21]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[22]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[23]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[24]; duration: 500 }
                PropertyAnimation { to: appWindow.trajetVoiture3[25]; duration: 500 }
            }
        }



        // Hexagones
        Component {
            id: hexagonComponent
            MapPolygon {
                border.color: "black"
                border.width: 1
                opacity: 0.7
                color: "transparent"

                property int hexagonId: modelData
                property real r: 0.001155 * 2 // Rayon
                property real w: Math.sqrt(3) * r // Largeur
                property real d: 1.5 * r // Espacement vertical
                property real row: Math.floor(hexagonId / 13)
                property real col: hexagonId % 13
                property real xOffset: (row % 2) * (w / 2)
                property real centerX: 47.7445 - 0.019 + col * w + xOffset
                property real centerY: 7.3400 - 0.043 + row * d

                function hexVertex(angle) {
                    return QtPositioning.coordinate(
                        centerX + r * Math.sin(angle),
                        centerY + r * Math.cos(angle)
                    );
                }

                path: [
                    hexVertex(Math.PI / 3 * 0),
                    hexVertex(Math.PI / 3 * 1),
                    hexVertex(Math.PI / 3 * 2),
                    hexVertex(Math.PI / 3 * 3),
                    hexVertex(Math.PI / 3 * 4),
                    hexVertex(Math.PI / 3 * 5)
                ]
            }
        }

        Repeater {
            id: hexagonRepeater
            model: 312 // Nombre d'hexagones
            delegate: hexagonComponent
        }

        // Timer pour vérifier les collisions
        Timer {
            interval: 100 // Vérifie toutes les 100 ms
            running: true
            repeat: true
            onTriggered: {
                let voitures = [
                    { id: voiture1, color: appWindow.carColors[0], signalStrength: 50 },
                    { id: voiture2, color: appWindow.carColors[1], signalStrength: 60 },
                    { id: voiture3, color: appWindow.carColors[2], signalStrength: 70 }
                ];

                for (let i = 0; i < hexagonRepeater.count; ++i) {
                    let hexagon = hexagonRepeater.itemAt(i);

                    // Réinitialise la couleur de l'hexagone
                    hexagon.color = "transparent";

                    // Dictionnaire pour accumuler les forces de signal par couleur
                    let signalByColor = {};

                    for (let voiture of voitures) {
                        let carX = voiture.id.coordinate.latitude;
                        let carY = voiture.id.coordinate.longitude;
                        let hexX = hexagon.centerX;
                        let hexY = hexagon.centerY;
                        let distance = Math.sqrt(Math.pow(carX - hexX, 2) + Math.pow(carY - hexY, 2));

                        if (distance <= hexagon.r) {
                            // Ajoute la force de signal au total pour cette couleur
                            if (!signalByColor[voiture.color]) {
                                signalByColor[voiture.color] = 0;
                            }
                            signalByColor[voiture.color] += voiture.signalStrength;
                        }
                    }

                    // Trouve la couleur avec la plus grande somme de force de signal
                    let maxSignal = 0;
                    let dominantColor = "transparent";

                    for (let color in signalByColor) {
                        if (signalByColor[color] > maxSignal) {
                            maxSignal = signalByColor[color];
                            dominantColor = color;
                        }
                    }

                    // Applique la couleur dominante à l'hexagone
                    hexagon.color = dominantColor;
                }
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
                color: "#4CAF50"
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
                color: "#F44336"
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
              color: "#444444cc" //
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
                      color: "#FFC107"
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
                      color: "#2196F3"
                      radius: 20
                  }
                  onClicked: {
                      // Utiliser des animations pour un mouvement plus doux
                      panAnimationY.from = map.center.latitude;
                      panAnimationY.to = map.center.latitude + 0.005; // Ajuster la valeur pour la distance
                      panAnimationY.start();
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
                      panAnimationY.from = map.center.latitude;
                      panAnimationY.to = map.center.latitude - 0.005;
                      panAnimationY.start();
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
                      panAnimationX.from = map.center.longitude;
                      panAnimationX.to = map.center.longitude - 0.005;
                      panAnimationX.start();
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
                      panAnimationX.from = map.center.longitude;
                      panAnimationX.to = map.center.longitude + 0.005;
                      panAnimationX.start();
                  }
              }



          }

}




































