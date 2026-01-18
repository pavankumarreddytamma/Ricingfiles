// ClockWidget.qml
import QtQuick

Rectangle {
    width: time.implicitWidth + 12
    height: 28
    color: "blue"
    Text {
        id: time
  text: Time.time
  font.pixelSize: 16
}
}



