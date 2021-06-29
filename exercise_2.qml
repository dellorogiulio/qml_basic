import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

ApplicationWindow {
    readonly property real target: targetController.value.toFixed(2)
    readonly property real actual: actualController.value.toFixed(2)

    title: qsTr("QML Course")
    width: 640
    height: 480
    visible: true

    Rectangle {
        id: mainView
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 0.8 * parent.height
        anchors.margins: 10
        border.width: 1


        Label {
            anchors.centerIn: parent
            text: " target: " + target + " actual: " + actual
        }
    }

    RowLayout {
        anchors.top: mainView.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 10
        spacing: 10


        SlideController {
            id: targetController
            Layout.fillWidth: true
            text: "target"
            from: 0
            to: 359.99
        }

        SlideController {
            Layout.fillWidth: true
            id: actualController
            text: "actual"
            from: 0
            to: 359.99
        }
    }



    component SlideController: RowLayout {
        property alias text: label.text
        property alias value: slider.value
        property alias from: slider.from
        property alias to: slider.to

        spacing: 5

        Label { id: label; verticalAlignment: Label.AlignVCenter; height: slider.height }
        Slider { id: slider; Layout.fillWidth: true; value: from }
    }

}
