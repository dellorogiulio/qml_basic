Rectangle {
    id: window
    color: "black"
    width: 800
    height: 400

    Image {
        id : rocket
        source : "rocket.png"
    }
    PathAnimation {
        id: pathAnim
        running: true
        duration: 3000
        loops: 10
        target: rocket
        orientation: PathAnimation.TopFirst //try to comment
        anchorPoint: Qt.point(rocket.width/2, //try to comment
                              rocket.height/2)

        path: Path {
            startX: 100; startY: window.height/2

            PathCubic {
                id: part1
                x: window.width - 100
                y: window.height/2
                control1X: 100; control1Y: 0
                control2X: x; control2Y: window.height
            }

            PathCubic { 
                id: part2
                x: 100
                y: window.height/2
                control1X: window.width - 100; control1Y: 0
                control2X: x; control2Y: window.height
            } 
        }
    }
    
    // The remaining of the code is simply to show the curves and the control points

    // C1
    Rectangle {
        color: "white"
        width:10; height:10
        x: part1.control1X-5; y: part1.control1Y-5
    }

    Text {
        text: "C1"
        color: "white"
        x: part1.control1X; y: part1.control1Y
        font.pointSize: 30
    }

    // C2
    Rectangle {
        color: "white"
        width:10; height:10
        x: part1.control2X-5; y: part1.control2Y-5
    }

    Text {
        text: "C2"
        color: "white"
        x: part1.control2X; y: part1.control2Y-50
        font.pointSize: 30
    }

    // The path
    PathView {
        anchors.fill: parent
        path: Path { startX: 100; startY: window.height/2; pathElements: part1 }
        model: 100
        delegate: Rectangle {
            width: 2; height: 2
            color: "white";
        }
    }

    // Second part ----------------------------------------------------------------------------

    // C1'
    Rectangle {
        color: "red"
        width:10; height:10
        x: part2.control1X-5; y: part2.control1Y-5
    }

    Text {
        text: "C1'"
        color: "red"
        x: part2.control1X; y: part2.control1Y
        font.pointSize: 30
    }

    // C2'
    Rectangle {
        color: "red"
        width:10; height:10
        x: part2.control2X-5; y: part2.control2Y-5
    }

    Text {
        text: "C2'"
        color: "red"
        x: part2.control2X; y: part2.control2Y-50
        font.pointSize: 30
    }

    // The path
    PathView {
        anchors.fill: parent
        path: Path { startX: window.width-100; startY: window.height/2; pathElements: part2 }
        model: 100
        delegate: Rectangle {
            width: 2; height: 2
            color: "red";
        }
    }
}