import QtQuick
import Quickshell
import Quickshell.Wayland

WlrLayerShell {
    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
    }
    height: 40
    layer: WlrLayerShell.Top
    namespace: "quickshell-bar"

    Rectangle {
        anchors.fill: parent
        color: "#1e1e2e" // Background

        Text {
            text: "⏻"
            color: "white"
            anchors.centerIn: parent
            
            // This MouseArea adds the "Functionality"
            MouseArea {
                anchors.fill: parent
                onClicked: powerMenu.visible = !powerMenu.visible
            }
        }
    }
}