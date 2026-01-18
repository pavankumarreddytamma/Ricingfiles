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
    anchors{
    centerIn: parent
    top: parent.top
    topMargin: 16
    } 

    width: clock.implicitWidth + 12
    height: parent.implicitHeight - 2
    color: "blue"
    radius: 8

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

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dataProc:running = true
    }
 }
 }


}

