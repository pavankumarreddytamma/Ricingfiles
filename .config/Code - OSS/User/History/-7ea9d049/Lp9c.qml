import QtQuick 6.5
import QtQuick.Window 6.5

Window {
    width: 400
    height: 300
    visible: true
    title: "My First QML App"

    Text {
        text: "Hello, QML!"
        anchors.centerIn: parent
        font.pixelSize: 24
    }
}
