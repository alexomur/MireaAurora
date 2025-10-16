import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    XmlListModel {
        id: currencyModel
        source: "http://www.cbr.ru/scripts/XML_daily.asp"
        query: "/ValCurs/Valute"

        XmlRole { name: "name"; query: "Name/string()" }
        XmlRole { name: "value"; query: "Value/string()" }
        XmlRole { name: "charCode"; query: "CharCode/string()" }
        XmlRole { name: "nominal"; query: "Nominal/string()" }
    }

    Column {
        anchors.fill: parent

        Text {
            text: "Курсы валют ЦБ РФ"
            font.bold: true
        }
        ListView {
            width: parent.width
            height: parent.height - 50
            model: currencyModel

            delegate: Rectangle {
                width: parent.width
                height: 50

                Row {
                    anchors.fill: parent

                    Text {
                        width: parent.width * 0.6
                        text: name + " (" + charCode + ")"
                    }

                    Text {
                        width: parent.width * 0.4
                        text: nominal + " = " + value + " руб."
                    }
                }
            }
        }
    }
}
