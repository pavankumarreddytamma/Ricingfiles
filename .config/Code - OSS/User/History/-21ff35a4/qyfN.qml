import QtQuick
import QtQuick.Controls
import Quickshell

PopupWindow {
    name: "launcher"    // 👈 must exist for IPC
    width: 400
    height: 300
    color: "#222222dd"
    radius: 10
    visible: false

    Column {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        ListView {
            anchors.fill: parent
            model: ListModel {
                ListElement { name: "Firefox"; command: "firefox" }
                ListElement { name: "Terminal"; command: "alacritty" }
                ListElement { name: "Files"; command: "thunar" }
            }

            delegate: Rectangle {
                width: parent.width
                height: 40
                color: ListView.isCurrentItem ? "#444" : "transparent"

                Text {
                    text: name
                    anchors.centerIn: parent
                    color: "white"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        Qt.openUrlExternally(command)
                        visible = false
                    }
                }
            }
        }
    }
}
