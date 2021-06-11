 Rectangle {
        color: "black"
        implicitWidth: child.implicitWidth
        implicitHeight: child.implicitHeight

        Image {
            id: child
            source : "gradient.jpg"
            anchors.fill: parent
            anchors.margins: 10
        }

		// Rectangle {
        //     id: child
        //     color: 'red'
        //     anchors.fill: parent
        //     anchors.margins: 10
        // }
    }