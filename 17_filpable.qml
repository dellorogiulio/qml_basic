Rectangle {
	id: window
	color: "black"
	width: 200
	height: 200

	Flipable {
		id: flipable
		anchors.centerIn: parent
		property bool flipped: false

		front: Rectangle {
			color: "green"
			width: 100
			height: 100
			anchors.centerIn: parent
		} 
		back: Rectangle {
			color: "red"
			width: 100
			height: 100
			anchors.centerIn: parent
		} 

		transform: Rotation {
			axis.x: 0; axis.y: 1; axis.z: 0
			angle: flipable.flipped ? 180 : 0

			Behavior on angle {
				NumberAnimation { duration: 500 }
			}
		}
	}

	MouseArea {
		anchors.fill: parent
		onClicked: flipable.flipped = !flipable.flipped
	}
}