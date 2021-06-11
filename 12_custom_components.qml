Rectangle {
    width: 400; height: 100; color: "lightblue"

    LineEdit {
        id: lineEdit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 16
        width: 300; height: 50
    }

    Text {
        anchors.top: lineEdit.bottom
        anchors.topMargin: 12
        anchors.left: parent.left
        anchors.leftMargin: 16
        text: "<b>Summary:</b> " + lineEdit.text
    }

    Image {
        id: clearButton
        source: "../images/clear.svg"
        anchors { right: parent.right; rightMargin: 4
                  verticalCenter: lineEdit.verticalCenter }
        opacity: lineEdit.text === "" ? 0.25 : 1.0
        MouseArea {
            anchors.fill: parent
            onClicked: lineEdit.text = "" // binding broken here!
        }
    }
}


// LineEdit.qml

import QtQuick 2.0

Rectangle {
    property string text: textInput.text

    border.color: "green"
    color: "white"
    radius: 4; smooth: true
    clip: true

    TextInput {
        id: textInput
        anchors.fill: parent
        anchors.margins: 2
        text: "Enter text..."
        color: focus ? "black" : "gray"
        font.pixelSize: parent.height - 4
    }
}




