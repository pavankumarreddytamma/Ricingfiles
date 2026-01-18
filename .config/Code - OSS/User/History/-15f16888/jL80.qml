import QtQuick
import Quickshell
import Quickshell.Wayland

ShellRoot {
    Variants {
        model: Quickshell.screens
        delegate: PanelWindow {
            id: bar
            property var screen: modelData
            
            // Layout
            anchors {
                top: true
                left: true
                right: true
            }
            height: 40
            
            // Latest Syntax: Direct properties
            layer: WlrLayer.Top
            exclusionMode: ExclusionMode.Exclusive 
            
            Rectangle {
                anchors.fill: parent
                color: "#1e1e2e"

                Row {
                    anchors.fill: parent
                    anchors.leftMargin: 20
                    verticalAlignment: Text.AlignVCenter

                    Text {
                        text: "󰣇 System Menu"
                        color: "white"
                        font.pixelSize: 16
                        
                        MouseArea {
                            anchors.fill: parent
                            onClicked: sysMenu.visible = !sysMenu.visible
                        }
                    }
                }
            }

            // Reference our separate menu file
            MyMenu {
                id: sysMenu
                anchorWindow: bar
            }
        }
    }
}