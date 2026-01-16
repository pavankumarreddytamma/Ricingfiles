import Quickshell
import Quickshell.Io    // For Process
import Quickshell.Hyprland
import QtQuick

/* Top bar container */
PanelWindow {
    id: bar
    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 30
    color: "#1e1e2e"

    Row {
        anchors.verticalCenter: parent.verticalCenter
        spacing: 12
        padding: 8

        /* = Workspaces Indicator = */
        Repeater {
            model: Hyprland.workspaces

            Rectangle {
                implicitWidth: 28
                implicitHeight: 24
                radius: 4
                color: modelData.active ? "#89b4fa" : "#6c6f93"

                Text {
                    anchors.centerIn: parent
                    text: modelData.name  // workspace name
                    color: "white"
                    font.pixelSize: 12
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: Hyprland.dispatch(`workspace ${modelData.id}`)
                }
            }
        }

        /* = Spacer = */
        Item { Layout.fillWidth: true }

        /* = Clock Widget = */
        Text {
            id: clock
            color: "white"
            font.pixelSize: 12
        }

        Timer {
            interval: 1000; running: true; repeat: true
            onTriggered: clockUpdater.exec()
        }

        /* Process to update clock */
        Process {
            id: clockUpdater
            command: ["date", "+%H:%M:%S"]
            running: false
            stdout: StdioCollector {
                onStreamFinished: clock.text = text.trim()
            }
        }

        /* = Battery Widget (example) = */
        Text {
            id: batteryText
            color: "white"
            font.pixelSize: 12
        }
        Process {
            id: batUpdater
            command: ["sh", "-c", "acpi | awk '{print $3}'"]
            running: true
            stdout: StdioCollector {
                onStreamFinished: batteryText.text = text.trim()
            }
        }

        /* = Volume Widget (example) = */
        Text {
            id: volumeText
            color: "white"
            font.pixelSize: 12
        }
        Process {
            id: volUpdater
            command: ["sh", "-c", "pamixer --get-volume-human"]
            running: true
            stdout: StdioCollector {
                onStreamFinished: volumeText.text = text.trim()
            }
        }
    }
}
