import Quickshell
import Quickshell.Io // for Process
import QtQuick

Scope {
  Time { id: timeSource }
PanelWindow {
  anchors {
    top: true
    left: true
    right: true

implicitHeight: 30

    ClockWidget {
        anchors.centerIn: parent
        time: timeSource.time
      }
  }

}
}
