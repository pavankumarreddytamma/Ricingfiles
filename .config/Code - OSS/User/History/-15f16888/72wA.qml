import QtQuick
import Quickshell
import Quickshell.Io

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }
 color: "green"
 implicitHeight: 36

 Rectangle {
    anchors.centerIn: parent
    width: clock.implicitWidth + 12
    height: parent.implicitHeight - 4
    color: "blue"
    radius: 8
    z: 2

     Text {
    id: clock
    anchors.centerIn: parent
    color: "white"
    font.pixelSize: 16

    Process {
        command: ["date"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: clock.text = this.text
        }
    }
 }
 }


}

