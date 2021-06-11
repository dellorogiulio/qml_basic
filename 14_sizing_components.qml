import QtQuick 2.0

Item {
    width: 800; height: 600

    // Using explicit width
    Row {
        id: topButtonRow

        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }

        spacing: 20

        Button {
            width: 300
            text: "Open"
        }

        Button {
            width: 300
            text: "Close"
        }
    }

    Rectangle {
        id: content
        color: "lightsteelblue"
        anchors {
            top: topButtonRow.bottom
            bottom: bottomButtonRow.top
            left: parent.left
            right: parent.right
        }

        Button {
            id: contentButton
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }
            height: 100
            text: "Test"
        }

        // Using explicit height
        Rectangle {
            anchors {
                left: contentButton.right
                verticalCenter: contentButton.verticalCenter
            }

            height: contentButton.height
            width: 50
            color: "red"
        }
    }

    // Using implicit width
    Row {
        id: bottomButtonRow

        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }

        spacing: 20

        Button {
            text: "Ok"
        }

        Button {
            text: "Cancel"
        }
    }
}



// Button.qml

import QtQuick 2.0

Item {
    id: root

    property alias text: label.text

    implicitWidth: label.implicitWidth + _margin * 2
    implicitHeight: background.implicitHeight

    readonly property int _margin: 35

    BorderImage {
        id: background
        anchors.fill: parent
        border.left: root._margin
		border.right:root._margin
        source: "images/button.png"
        Text {
            id: label
            anchors.centerIn: parent
            font.pixelSize: 30
        }
    }

}