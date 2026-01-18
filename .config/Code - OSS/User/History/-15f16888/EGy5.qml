import QtQuick
import Quickshell
import Quickshell.Wayland

// Use "Scope" or just start with your Window components.
// We'll use a LazyComponent to handle the screen mapping properly.

Scope {
    // This creates the bar on every monitor
    Variants {
        model: Quickshell.screens
        
        delegate: PanelWindow {
            id: bar
            property var screen: modelData
            
            // Positioning
            anchors {
                top: true
                left: true
                right: true
            }
            height: 42
            
            // Wayland & Hyprland specific config
            WlrLayer.layer: WlrLayer.Top
            WlrLayer.exclusive: true // Ensures windows don't overlap the bar
            
            Rectangle {
                anchors.fill: parent
                color: "#11111b" // Deep dark background
                
                Row {
                    anchors.fill: parent
                    anchors.leftMargin: 15
                    anchors.rightMargin: 15
                    spacing: 20
                    
                    // A simple Menu Button
                    Text {
                        text: "󰍜 Menu"
                        color: "#cba6f7"
                        font.bold: true
                        anchors.verticalCenter: parent.verticalCenter
                        
                        MouseArea {
                            anchors.fill: parent
                            onClicked: myMenu.visible = !myMenu.visible
                        }
                    }
                }
            }

            // The Menu (External File)
            SystemMenu {
                id: myMenu
                anchorWindow: bar
            }
        }
    }
}