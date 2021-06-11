Rectangle {
    width: 400; height: 300;
    color: "lightblue"

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 40
        height: parent.height / 2
        text: "Press me"
        font.pixelSize: 48

        MouseArea {
            anchors.fill: parent
            onPressed: () => parent.color = "green"
            onReleased: () => parent.color = "black"
        }
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height / 2 + 40
        height: parent.height / 2
        text: "Click me"
        font.pixelSize: 48

        MouseArea {
            anchors.fill: parent
            onClicked: () => parent.font.bold = !parent.font.bold
        }
    }
}


// next

Rectangle {
    width: 400; height: 200;
    color: "lightblue"

    Text {
        anchors.centerIn: parent
        text: "Press me"; font.pixelSize: 48
        color: mouseArea.pressed ? "green" : "black"

        MouseArea {
            id: mouseArea
            anchors.fill: parent
        }
    }
}