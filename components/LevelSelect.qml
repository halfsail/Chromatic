import QtQuick 2.0
import Ubuntu.Components 1.1
import "../components/backend.js" as Logic
import U1db 1.0 as Udb
import Ubuntu.Components.Popups 1.0
import Ubuntu.Components.ListItems 0.1 as ListItem
import "../components/"

Component {
        id: popoverComponent
        Popover {
            id: popover
            pointerTarget:parent
            Column {
                id: containerLayout
                anchors {
                    left: parent.left
                    top: parent.top
                    right: parent.right
                }
                ListItem.Header { text: "Standard list items" }
                ListItem.Standard { text: "Do something" }
                ListItem.Standard { text: "Do something else" }
                ListItem.Header { text: "Buttons" }
                ListItem.SingleControl {
                    highlightWhenPressed: false
                    control: Button {
                        text: "Do nothing"
                        anchors {
                            fill: parent
                            margins: units.gu(1)
                        }
                    }
                }
                ListItem.SingleControl {
                    highlightWhenPressed: false
                    control: Button {
                        text: "Close"
                        anchors {
                            fill: parent
                            margins: units.gu(1)
                        }
                        onClicked: PopupUtils.close(popover)
                    }
                }
            }
        }
    }
