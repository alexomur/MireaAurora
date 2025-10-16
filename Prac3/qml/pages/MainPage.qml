import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    ListModel {
        id: listModel
        Component.onCompleted: {
            append({ bgColor: "red", textColor: "white", name: "red", number: 1 })
            append({ bgColor: "blue", textColor: "white", name: "blue", number: 2 })
            append({ bgColor: "green", textColor: "black", name: "green", number: 3 })
        }
    }

    Column {
        anchors {
            top: parent.top
            topMargin: Theme.paddingLarge
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        spacing: Theme.paddingMedium

        Button {
            text: "Добавить прямоугольник"
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: {
                var colors = [
                    {name: "cyan", textColor: "black"},
                    {name: "magenta", textColor: "white"},
                    {name: "yellow", textColor: "black"},
                    {name: "gray", textColor: "white"}
                ]
                var randomColor = colors[Math.floor(Math.random() * colors.length)]
                listModel.append({
                    bgColor: randomColor.name,
                    textColor: randomColor.textColor,
                    name: randomColor.name,
                    number: listModel.count + 1
                })
            }
        }

        ListView {
            width: parent.width
            height: parent.height - Theme.itemSizeLarge * 2
            model: listModel
            spacing: Theme.paddingSmall
            clip: true

            delegate: Rectangle {
                width: ListView.view.width - Theme.paddingLarge * 2
                height: Theme.itemSizeLarge
                anchors.horizontalCenter: parent.horizontalCenter
                color: bgColor
                radius: Theme.paddingSmall

                Text {
                    anchors.centerIn: parent
                    text: name + "\nНомер: " + number
                    color: textColor
                    font.pixelSize: Theme.fontSizeMedium
                    horizontalAlignment: Text.AlignHCenter
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: listModel.remove(index)
                }
            }
        }

        Button {
            text: "Курсы валют"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
        }
    }
}
