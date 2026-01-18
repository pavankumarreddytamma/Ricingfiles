import QtQuick
import Quickshell
import Quickshell.Wayland

PopupWindow {
    id: root
    visible: false
    
    // Position the menu relative to the bar
    anchor.window: anchorWindow
    anchor.rect.x: 20
    anchor.rect.y: 45 // Slightly below the 40px bar
    anchor.edges: Edges.Top | Edges.Left

    Rectangle {
        width: 150
        height: 100
        color: "#313244"
        radius: 8
        border.color: "#cba6f7"
        border.width: 1

        Column {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            // Functional Button: Power Off
            Rectangle {
                width: parent.width - 20
                height: 30
                color: "#45475a"
                radius: 4
                
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

            // Functional Button: Close
            Text {
                text: "Close Menu"
                color: "#f38ba8"
                anchors.horizontalCenter: parent.horizontalCenter
                MouseArea {
                    anchors.fill: parent
                    onClicked: root.visible = false
                }
            }
        }
    }
}