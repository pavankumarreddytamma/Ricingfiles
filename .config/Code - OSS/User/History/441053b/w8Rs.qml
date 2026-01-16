import Quickshell
import Quickshell.Io // for Process
import QtQuick

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
    
}
