// 1

Rectangle {
    width: 400; height: 400
    color: "lightblue"

    Rectangle {
        y: 150; width: 100; height: 100
        color: "green"
        NumberAnimation on x {
            from: 0; to: 150
            duration: 1000
        }
    }
}

// 2

Rectangle {
    width: 400; height: 400; color: "lightblue"

    Rectangle {
        id: rect
        x: 300; y: 300
        width: 100; height: 100
    }

    NumberAnimation {
        target: rect
        properties: "x,y"
        to: 150; duration: 1000
        running: true
    }
}




// 3

Rectangle {
    width: 400; height: 400; color: "lightblue"

    Rectangle {
        id: rect
        x: 300; y: 300
        width: 100; height: 100
    }

    MouseArea {
        anchors.fill: parent
        onClicked: () => {
            animation.to = rect.x === 150 ? 0 : 150
            animation.running = true
        }
    }

    NumberAnimation {
        id: animation
        target: rect
        properties: "x,y"
        to: 150; duration: 1000
        // easing.type: Easing.OutBounce  // EASING
    }
}


// 4 
Item {
    width: 400; height: 400

    Image {
        id: rocket
        source: "rocket.png"
        anchors.centerIn: parent
        smooth: true

        RotationAnimation on rotation {
            from: 45; to: 315
            direction: RotationAnimation.Shortest // try to remove
            duration: 1000
        }
    }
}


// 5 

Rectangle {
    color: "lightblue"
    width: 300; height: 300
    Rectangle {
        id: rect
        x: 100; y: 100
        width: 50; height: 50
        color: "red"

        Behavior on x { SpringAnimation { spring: 1; damping: 0.2 } }
        Behavior on y { SpringAnimation { spring: 2; damping: 0.2 } }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            rect.x = mouse.x - rect.width/2
            rect.y = mouse.y - rect.height/2
        }
    }
}

// 6
Rectangle {
    width: 300; height: 300; color: "#000040"

    Image {
        id: rocket
        anchors.centerIn: parent
        source: "rocket.png"
    }

    SequentialAnimation {
        NumberAnimation {
            target: rocket; properties: "scale"
            from: 1.0; to: 0.5; duration: 1000
        }
        // PauseAnimation {
        //     duration: 500
        // }
        NumberAnimation {
            target: rocket; properties: "opacity"
            from: 1.0; to: 0.0; duration: 1000
        }
        running: true
    }
}


// 7
Rectangle {
    width: 300; height: 300; color: "#000040"

    Image {
        id: rocket
        anchors.centerIn: parent
        source: "rocket.png"
    }

    ParallelAnimation {
        NumberAnimation {
            target: rocket; properties: "scale"
            from: 1.0; to: 0.5; duration: 1000
        }
        NumberAnimation {
            target: rocket; properties: "opacity"
            from: 1.0; to: 0.0; duration: 1000
        }
        running: true
    }
}

