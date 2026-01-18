import QtQuick
import Quickshell
import Quickshell.Wayland

PopupWindow {
    id: menuRoot
    visible: false
    
    // This tells the popup where to appear
    anchor.window: anchorWindow
    anchor.edges: Edges.Top | Edges.Left
    
    // Adding a small margin so it doesn't touch the bar perfectly
    anchor.rect.y: 45 
    anchor.rect.x: 10

    Rectangle {
        width: 180
        height: 100
        color: "#1e1e2e"
        border.color: "#313244"
        border.width: 1
        radius: 8

        Column {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            // Shutdown Button
            Rectangle {
                width: parent.width
                height: 35
                color: "#313244"
                radius: 4
                
                Text {
                    anchors.centerIn: parent
                    text: "Shutdown"
                    color: "#f38ba8"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        menuRoot.visible = false
                        Quickshell.run(["shutdown", "now"])
                    }
                }
            }
        }
    }
}