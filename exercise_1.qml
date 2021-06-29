import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

ApplicationWindow {
    readonly property real min: minController.value.toFixed(2)
    readonly property real max: maxController.value.toFixed(2)
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
            text: "min: " + min + " max: " + max + " target: " + target + " actual: " + actual
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
            id: minController
            text: "min"
            from: -0.5
            to: -0.1
            Layout.fillWidth: true
        }

        SlideController {
            id: maxController
            Layout.fillWidth: true
            text: "max"
            from: 0.1
            to: 0.5
        }

        SlideController {
            id: targetController
            Layout.fillWidth: true
            text: "target"
            from: -0.1
            to: 0.1
        }

        SlideController {
            Layout.fillWidth: true
            id: actualController
            text: "actual"
            from: -1
            to: 1
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
