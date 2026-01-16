import Quickshell
import Quickshell.Io // for Process
import QtQuick

Scope {
    id: root
    property string time

PanelWindow {
  anchors {
    top: true
    left: true
    right: true

    ClockWidget {
        anchors.centerIn: parent
        time: root.time
      }
  }

  implicitHeight: 30
  property string time

  Text {

    anchors.centerIn: parent
     text: root.time
    
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
}