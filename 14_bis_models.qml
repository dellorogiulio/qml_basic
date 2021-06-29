import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    property int count: 0
    property color myColor: count < 2 ? "black" :  "yellow"
    property string myText: count < 1 ? "black" :  "yellow"


    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property var jsModel: [
        {
            color: myColor,
            number: 10,
        },
        {
            color: "silver",
            number: 11
        },
        {
            color: "green",
            number: 9
        },
        {
            color: "blue",
            number: 8
        },


    ]

    Button {
        text: "remove an item"
        onClicked: () => count++//jsModel.splice(0, 1)
        anchors.right: parent.right
    }



    ListModel {
        id: rectanglesModel

        ListElement {
            color: "red"
            number: 10
        }
        ListElement {
            color: "silver"
            number: 10
        }
        ListElement {
            color: "green"
            number: 10
        }
        ListElement {
            color: "blue"
            number: 10
        }
    }

    Grid {
        x: 15; y: 15; width: 300; height: 300

        columns: 2; rows: 2; spacing: 20

        Component.onCompleted: {
            for (let i = 0; i < rectanglesModel.count; ++i) {
                console.log(rectanglesModel.get(i))
            }

            for (let j of jsModel) {
                console.log(JSON.stringify(j))
            }

        }

        /*
          number
          js array / obj
          ListModel
          fromCpp

           */
        Repeater {
//            model: rectanglesModel
            model: jsModel
            delegate: Rectangle {
                required property int index
                required property var modelData // or model according to model type
                width: 125; height: 125; color: modelData.color
                Text {
                    text: modelData.number
                    anchors.centerIn: parent
                    font.pointSize: 15
                }
            }
        }
    }



}

