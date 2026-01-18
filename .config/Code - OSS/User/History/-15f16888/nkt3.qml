import QtQuick
import Quickshell
import Quickshell.io

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }
 color: "green"
 implicitHeight: 36

 Text {
    id: clock
    anchors.centerIn: parent
    color: "white"
    font.pixelSize: 16

    Process {
        command: ["date"]
    }
 }
}

