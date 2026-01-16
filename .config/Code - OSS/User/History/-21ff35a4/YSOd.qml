import QtQuick
import QtQuick.Controls
import Quickshell

PopupWindow {
    id: win
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

        ListView {
            id: list
            model: DesktopApplicationsModel {
                filter: win.query
            }

            delegate: Rectangle {
                width: parent.width
                height: 50
                color: ListView.isCurrentItem ? "#444" : "transparent"

                Text {
                    text: model.name
                    anchors.centerIn: parent
                    color: "white"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        model.launch()
                        win.visible = false
                    }
                }
            }
        }
    }
}
