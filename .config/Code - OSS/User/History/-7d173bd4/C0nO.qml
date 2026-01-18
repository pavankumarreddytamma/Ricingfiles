import QtQuick
import Quickshell
import Quickshell.Wayland

WlrLayerShell {
    anchors.centerIn: parent
    width: 200
    height: 100
    layer: WlrLayerShell.Overlay // Stays on top of everything
    
    // This ensures the menu closes if you click outside or press Esc
    exclusionMode: WlrLayerShell.None 
    keyboardFocus: WlrLayerShell.OnDemand

    Rectangle {
        anchors.fill: parent
        color: "#313244"
        radius: 10
        border.color: "#cba6f7"

        Column {
            anchors.centerIn: parent
            spacing: 10
            
            Text { 
                text: "Shutdown"; color: "white"
                MouseArea { 
                    anchors.fill: parent
                    onClicked: Quickshell.run(["shutdown", "now"]) 
                }
            }
            Text { 
                text: "Close Menu"; color: "gray"
                MouseArea { 
                    anchors.fill: parent
                    onClicked: visible = false 
                }
            }
        }
    }
}