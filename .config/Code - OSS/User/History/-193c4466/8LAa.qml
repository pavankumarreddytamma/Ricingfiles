// ClockWidget.qml
import QtQuick

Rectangle {
    width: time.implicitWidth + 14
    height: 28
    color: "#275bf54d"
    radius: 8
    Text {
        anchors.centerIn: parent
        id: time
        text: Time.time
        font.pixelSize: 16
}
}



