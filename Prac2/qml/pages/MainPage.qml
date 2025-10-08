import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    Rectangle {
        color: "red"
        x: 100
        y: 100
        width: 100; height: 100
        z: 0
    }

    Rectangle {
        color: "green"
        x: 200
        y: 150
        width: 100; height: 100
        z: 0
    }

    Rectangle {
        color: "blue"
        x: 250
        y: 100
        width: 100; height: 100
        z: 1
        Text {
            id: name
            text: qsTr("Квадрат")
            color: "white"
        }
    }

    Rectangle {
        id: rect
        color: "white"
        x: 300
        y: 400
        width: 250; height: 250
        transform: [
            Rotation {
                id: rotation
                axis.x: 1; axis.y: 1
                angle: 60
                origin.x: 300; origin.y: 300
            }
        ]

        SequentialAnimation {
            running: true
            loops: Animation.Infinite

            ParallelAnimation {
                NumberAnimation {
                    target: rect
                    property: "width"
                    to: 100
                    duration: 1000
                }
                NumberAnimation {
                    target: rect
                    property: "height"
                    to: 350
                    duration: 1000
                }
            }

            ParallelAnimation {
                NumberAnimation {
                    target: rect
                    property: "width"
                    to: 250
                    duration: 1000
                }
                NumberAnimation {
                    target: rect
                    property: "height"
                    to: 250
                    duration: 1000
                }
            }
        }
    }

    Timer {
        running: true
        interval: 16
        repeat: true
        onTriggered: rotation.angle += 2
    }
}
