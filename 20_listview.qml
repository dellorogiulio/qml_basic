

Rectangle {
	width: 150; height: 200; color: "white"

	ListModel {
		id: nameModel
		ListElement { age: 41; name: "Alice" }
		ListElement { age: 42; name: "Bob" }
		ListElement { age: 43; name: "Jane" }
		ListElement { age: 44; name: "Victor" }
		ListElement { age: 45; name: "Wendy" }
	}

	Component {
		id: nameDelegate

		Rectangle {
			required property var model
			border.color: "black"
			border.width: 1
			height: name.height + age.height
			width: name.width

			Column {
				Text {
					id: name
					text: model.name
					font.pixelSize: 32
				}
				Text {
					id: age
					text: model.age
					font.pixelSize: 32
				}
			}
			// Component.onCompleted: console.log("Welcome", model.name)
			// Component.onDestruction: console.log("Goodbye", model.name)
		}
	}

	ListView {
		anchors.fill: parent
		model: nameModel
		delegate: nameDelegate
		clip: true

	}
}




// customization

Rectangle {
    width: 150; height: 220; color: "white"

    ListModel {
        id: nameModel
        ListElement { name: "Alice" }
        ListElement { name: "Bob" }
        ListElement { name: "Jane" }
        ListElement { name: "Harry" }
        ListElement { name: "Wendy" }
    }

    Component {
        id: nameDelegate
        Text {
            readonly property ListView __lv: ListView.view
            width: parent.width
            text: model.name;
            font.pixelSize: 32


            MouseArea {
                anchors.fill: parent
                onClicked: __lv.currentIndex = model.index
            }
        }
    }
    ListView {
        anchors.fill: parent
        model: nameModel
        delegate: nameDelegate
        focus: true
        clip: true
        header: Rectangle {
            anchors { left: parent.left; right: parent.right }
            height: 10
            color: "pink"
        }
        footer: Rectangle {
            anchors { left: parent.left; right: parent.right }
            height: 10
            color: "lightblue"
        }
        highlight: Rectangle {
            anchors { left: parent.left; right: parent.right }
            color: "lightgray"
        }
    }
}