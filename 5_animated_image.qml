Rectangle {
	id: root
	width: 400; height: 350
	color: "#00a3fc"

	AnimatedImage {
		id: animation

		x: 100; y: 50
		width: 200; height: 200

		source: "qrc:///image-animated.gif"
	}

	Rectangle {
		x: 100; y: 260; width: 200; height: 24
		color: "black"

		Rectangle {
			width: 4; height: 24
			color: "red"

			x: (parent.width - width) * animation.currentFrame / animation.frameCount
		}

		Text {
			text: "Frame %1 of %2".arg(animation.currentFrame).arg(animation.frameCount)
			color: "white"
			font.pixelSize: 18
		}
	}
}