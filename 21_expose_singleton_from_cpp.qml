import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import Cemb.Backend 1.0


ApplicationWindow {

    title: qsTr("QML Course")
    width: 640
    height: 480
    visible: true



    Rectangle {
        width: 150; height: 200; color: "red"
        x: 100; y: 100

        Label {
            id: label
            anchors.centerIn: parent
            text: Backend.myString
        }


        TextEdit {
            anchors.top: label.bottom
            anchors.horizontalCenter: label.horizontalCenter
            text: Backend.myString
            onTextChanged: () => console.log(Backend.myFunc(), Backend.myFunc2())

        }


    }



}
