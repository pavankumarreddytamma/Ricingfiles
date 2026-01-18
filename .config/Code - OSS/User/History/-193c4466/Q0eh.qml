// ClockWidget.qml
import QtQuick

Rectangle {
    width: time.implicitWidth + 24
    height: 28
    color: '#50020742'
    radius: 8
    Text {
        anchors.centerIn: parent
        id: time
        text: Time.time
        font.pixelSize: 16
        color: '#e1ffffff'
}
}



