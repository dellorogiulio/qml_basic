// 1

Grid {
    x: 15; y: 15; width: 300; height: 300

    columns: 2; rows: 2; spacing: 20

    Rectangle { width: 125; height: 125; color: "red" }
    Rectangle { width: 125; height: 125; color: "green" }
    Rectangle { width: 125; height: 125; color: "silver" }
    Rectangle { width: 125; height: 125; color: "blue" }
}


// 2

Rectangle {
    width: 400; height: 400; color: "black"

    Grid {
        x: 5; y: 5
        rows: 5; columns: 5; spacing: 10

        Repeater {
            model: 24 // focus here
            delegate: Rectangle { // "delegate" is implicit 
				required property int index  // <-- attached property
                width: 70; height: 70
                color: "lightgreen"
                Text {
                    anchors.centerIn: parent
                    text: model.index
                    font.pointSize: 30
                }
            }
        }
    }
}

// 3

Rectangle {
    width: 400; height: 400; color: "black"

    Component {
        id: rectangleComponent

        Rectangle {
            width: 70;
            height: 70
            color: "lightgreen"
        }
    }

    Grid {
        x: 5; y: 5
        rows: 5; columns: 5; spacing: 10

        Repeater {
            model: 24
            delegate: rectangleComponent
        }
    }
}

// 4

Grid {
    x: 15; y: 15; width: 300; height: 300

    columns: 2; rows: 2; spacing: 20

    Repeater {
        model:  ["red", "green", "silver", "blue"]
        delegate: Rectangle {
			required property var modelData
            width: 125; height: 125; color: modelData // old -> model.modelData
        }
    }
}

// 5

Grid {
    x: 15; y: 15; width: 300; height: 300

    columns: 2; rows: 2; spacing: 20

    Repeater {
        model:  [
			{
				color: "red", 
				value: 32
			},
			{
				color: "green", 
				value: 12
			},
			{
				color: "silver", 
				value: 77
			},
			{
				color: "blue", 
				value: 1
			},
		]
        delegate: Rectangle {
			required property var modelData
            width: 125; height: 125; color: modelData.color
			Text {
				anchors.centerIn: parent
				text: modelData.value
				font.pointSize: 30
			}
        }
    }
}


// 6

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
		}
	}

	Column {
		anchors.fill: parent
		Repeater {
			model: nameModel
			delegate: nameDelegate
		}
	}
}