import Quickshell.Bluetooth
pragma Singleton
import QtQuick

Item {
    id: root
    width: 28
    height: 28

    Bluetooth {
        id: bt
    }

    MouseArea {
        anchors.fill: parent
        onClicked: bluetoothPopup.visible = !bluetoothPopup.visible
    }

    Text {
        anchors.centerIn: parent
        text: ""   // Nerd Font Bluetooth icon
        font.pixelSize: 18
        color: bt.enabled ? "#4da3ff" : "#888888"
    }

    PopupWindow {
        id: bluetoothPopup
        anchors.top: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false
    }
}


