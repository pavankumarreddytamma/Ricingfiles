import QtQuick
import Quickshell
import Quickshell.Wayland

PopupWindow {
    id: root
    visible: false
    
    // Positioning logic
    anchor.window: anchorWindow
    anchor.edges: Edges.Top | Edges.Left
    anchor.rect.y: 42 // Gap so it doesn't overlap the 40px bar
    anchor.rect.x: 10

    Rectangle {
        width: 150
        height: 80
        color: "#313244"
        radius: 8
        border.color: "#cba6f7"
        border.width: 1

        Column {
            anchors.centerIn: parent
            spacing: 10

            // Shutdown button functionality
            Rectangle {
                width: 120
                height: 30
                color: "#45475a"
                radius: 5
                
                Text {
                    anchors.centerIn: parent
                    text: "Shutdown"
                    color: "white"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("Shutting down...")
                        Quickshell.run(["shutdown", "now"])
                    }
                }
            }
        }
    }
}