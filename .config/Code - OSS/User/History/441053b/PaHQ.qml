import Quickshell // for PanelWindow
import QtQuick // for Text

PanelWindow {
  anchors {
    top: true
    left: true
    right: true
  }

  implicitHeight: 28

  Text {
    id: clock
    // center the bar in its parent component (the window)
    anchors.centerIn: parent

    text: "hello world"
  }
}