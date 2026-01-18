// ClockWidget.qml
import QtQuick

Rectangle {
    width: implicitWidth + 12
    color: "blue"
    Text {
        id: time
  text: Time.time
  font.pixelSize: 16
}
}



