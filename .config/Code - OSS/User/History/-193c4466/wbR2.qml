// ClockWidget.qml
import QtQuick

Rectangle {
    width: time.implicitWidth + 12
    height: 28
    color: "blue"
    Text {
        anchors.centerIn: parent
        id: time
  text: Time.time
  font.pixelSize: 16
}
}



