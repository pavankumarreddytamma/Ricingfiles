import QtQuick
import Quickshell
import Quickshell.Wayland

Scope {
    Variants {
        model: Quickshell.screens
        
        delegate: PanelWindow {
            id: bar
            property var screen: modelData
            
            // Basic Window Config
            anchors {
                top: true
                left: true
                right: true
            }
            height: 42
            
            // Fixed: Use direct properties instead of attached WlrLayer objects
            // In current Quickshell, PanelWindow inherits layer properties.
            layer: WlrLayer.Top
            exclusive: true // This replaces WlrLayer.exclusive
            
            Rectangle {
                anchors.fill: parent
                color: "#11111b"
                
                Row {
                    anchors.fill: parent
                    anchors.leftMargin: 15
                    spacing: 20
                    
                    Text {
                        text: "󰍜 Menu"
                        color: "#cba6f7"
                        font.pixelSize: 18
                        anchors.verticalCenter: parent.verticalCenter
                        
                        MouseArea {
                            anchors.fill: parent
                            onClicked: myMenu.visible = !myMenu.visible
                        }
                    }
                }
            }

            // The Menu Component
            SystemMenu {
                id: myMenu
                anchorWindow: bar
            }
        }
    }
}