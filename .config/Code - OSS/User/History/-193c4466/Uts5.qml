// ClockWidget.qml
import QtQuick

Rectangle {
    width: time.implicitWidth + 14
    height: 28
    color: '#ab8b94f7'
    radius: 8
    Text {
        anchors.centerIn: parent
        id: time
        text: Time.time
        font.pixelSize: 16
        color: "#ccced1f1"
}
}



