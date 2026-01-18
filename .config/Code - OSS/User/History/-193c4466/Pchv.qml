// ClockWidget.qml
import QtQuick

Rectangle {
    width: time.implicitWidth + 12
    color: "blue"
    Text {
        id: time
  text: Time.time
  font.pixelSize: 16
}
}



