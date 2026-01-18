// Bar.qml
import QtQuick
import Quickshell

Scope {

  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 36
      color: "transparent"

      ClockWidget {
        anchors.centerIn: parent

      }

      Row {
        spacing: 12
        anchors {
          left: parent.left
          leftMargin: 16
          }
        




      }
    }
  }
}