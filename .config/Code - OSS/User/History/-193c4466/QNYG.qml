// ClockWidget.qml
import QtQuick

Rectangle {
    width: time.implicitWidth + 12
    height: 28
    color: "blue"
    radius: 8
    Text {
        anchors.centerIn: parent
        id: time
  text: Time.time
  font.pixelSize: 16
}
}



