import Quickshell
import Quickshell.Io // for Process
import QtQuick

Scope {
    property string time

PanelWindow {
  anchors {
    top: true
    left: true
    right: true
  }

  implicitHeight: 30
  property string time

  Text {
    // give the text an ID we can refer to elsewhere in the file
    id: clock

    anchors.centerIn: parent
     text: root.Timer
    
  }
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
      onTriggered: dateProc.running = true
    }
}
}