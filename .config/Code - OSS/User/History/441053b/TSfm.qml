import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 30
    color: "#ffffff"

    Text {
        anchors.centerIn: parent
        text: "My First Bar"
        color: "#000000"
        font.pixelSize: 14
    }
}
