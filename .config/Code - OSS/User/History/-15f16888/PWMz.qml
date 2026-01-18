import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland

Shell {
    // This creates a bar for every connected monitor
    Variants {
        model: Quickshell.screens
        delegate: PanelWindow {
            id: bar
            property var screen: modelData
            
            // Layout settings
            anchors {
                top: true
                left: true
                right: true
            }
            height: 40
            
            // Hyprland/Wayland specific layering
            layer: WlrLayer.Top
            exclusionMode: ExclusionMode.Exclusive // Pushes windows down so they don't overlap

            Rectangle {
                anchors.fill: parent
                color: "#1e1e2e" // Catppuccin Mocha Base

                Row {
                    anchors.centerIn: parent
                    spacing: 20

                    // Button to trigger our Menu
                    Text {
                        text: "󰣇 System"
                        color: "white"
                        font.pixelSize: 16
                        
                        MouseArea {
                            anchors.fill: parent
                            onClicked: sysMenu.visible = !sysMenu.visible
                        }
                    }
                }
            }

            // Our Menu (defined below)
            Menu {
                id: sysMenu
                anchorWindow: bar // Tells the menu which window to "stick" to
            }
        }
    }
}