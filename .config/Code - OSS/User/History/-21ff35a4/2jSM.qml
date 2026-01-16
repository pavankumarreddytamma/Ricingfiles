import QtQuick
import QtQuick.Controls
import Quickshell

PopupWindow {
    id: win
    name: "launcher"        // 👈 This is what IPC sees
    width: 600
    height: 500
    visible: false

    color: "#111111ee"
    radius: 12

    property string query: ""

    Column {
        anchors.fill: parent
        spacing: 10
        padding: 20

        TextField {
            id: search
            placeholderText: "Search apps..."
            font.pixelSize: 20
            onTextChanged: win.query = text
            focus: true
        }

        ListModel {
    id: apps
    ListElement { name: "Firefox"; command: "firefox" }
    ListElement { name: "Terminal"; command: "alacritty" }
}

ListView {
    model: apps
    delegate: Rectangle {
        width: parent.width
        height: 50

        Text {
            text: name
            anchors.centerIn: parent
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                Qt.openUrlExternally(command)
            }
        }
    }
}


    onVisibleChanged: {
        if (visible) {
            search.text = ""
            search.forceActiveFocus()
        }
    }
}
