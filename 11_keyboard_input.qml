Rectangle {
    width: 200; height: 112; color: "lightblue"

    TextInput {
        anchors.left: parent.left; y: 16
        anchors.right: parent.right
        text: "Field 1"; font.pixelSize: 32
        color: activeFocus ? "black" : "gray"
        focus: true
        activeFocusOnTab: true\
		// onActiveFocusChanged: () => console.log("1 has active focus?", activeFocus)	
    }
    TextInput {
        anchors.left: parent.left; y: 64
        anchors.right: parent.right
        text: "Field 2"; font.pixelSize: 32
        color: activeFocus ? "black" : "gray"
        activeFocusOnTab: true
		// onActiveFocusChanged: () => console.log("2 has active focus?", activeFocus)	
    }
}





Rectangle {
	width: 400; height: 200; color: "black"

	Rectangle {
		id: leftRect
		anchors {
			verticalCenter: parent.verticalCenter
			left: parent.left
			leftMargin: 25
		}
		width: 150; height: 150
		color: activeFocus ? "red" : "darkred"
		KeyNavigation.right: rightRect
		focus: true
	}

	Rectangle {
		id: rightRect
		anchors {
			verticalCenter: parent.verticalCenter
			right: parent.right
			rightMargin: 25
		}
		width: 150; height: 150
		color: activeFocus ? "#00ff00" : "#008800"
		KeyNavigation.left: leftRect
	}
}   



Rectangle {
	width: 400; height: 400; color: "#00a3fc"
	focus: true

	Image {
		id: rocket
		anchors.centerIn: parent
		source: "rocket.png"
	}

	Keys.onLeftPressed: () => rocket.rotation = (rocket.rotation - 10) % 360
	Keys.onRightPressed: () => rocket.rotation = (rocket.rotation + 10) % 360
}