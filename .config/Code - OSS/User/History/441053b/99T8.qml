import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    id: root
    property string time
  Variants {
    model: Quickshell.screens

    delegate: Component {
      PanelWindow {
        required property var modelData
        screen: modelData

        anchors {
          top: true
          left: true
          right: true
        }

        implicitHeight: 36

        Text {
          anchors.centerIn: parent
          font.pixelSize: 16
          text: root.time
        }
      }
    }
  }

  Process {
    id: dateProc
    command: ["date"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: root.time = this.text
    }
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: dateProc.running = true
  }
}