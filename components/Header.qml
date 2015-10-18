import QtQuick 2.2
import Ubuntu.Components 1.1
import Ubuntu.Components.Popups 1.0

Item {
    property int currentPuzzle
    property var puzzles
    property var onBack
    property var onForward
    anchors.left: parent.left
    anchors.right: parent.right
    height: label.height
    property real inactiveOpacity: 0.3
    Text {
        text: "[]"
        anchors.verticalCenter: parent.verticalCenter
        MouseArea {
            anchors.fill: parent
        }
    }
    Row {
        spacing: units.gu(1)
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            // FIXME: icon
            property bool active: currentPuzzle > 0
            onActiveChanged: back.enabled = active
            text: "<"
            opacity: active ? 1 : inactiveOpacity
            anchors.verticalCenter: label.verticalCenter
            MouseArea {
                id: back
                anchors.fill: parent
                onClicked: active ? onBack() : null;
            }
        }
        Label {
            id: label
            fontSize: "x-large"
            font.weight: Font.Light;
            text: "Level " + (currentPuzzle + 1)
            color: "#5f5f5f"
            MouseArea {
                anchors.fill: parent
                onClicked: PopupUtils.open(levelList, parent)
            }
        }
        Text {
            // FIXME: icon
            property bool active: currentPuzzle < numPuzzles
            onActiveChanged: forward.enabled = active
            text: ">"
            opacity: active ? 1 : inactiveOpacity
            anchors.verticalCenter: label.verticalCenter
            MouseArea {
                id: forward
                anchors.fill: parent
                onClicked: active ? onForward() : null;
            }
        }
        Component {
            id: levelList
            Popover {
                pointerTarget: label
                ListView {
                    height: units.gu(30)
                    anchors.left: parent.left
                    anchors.right: parent.right
                    clip: true
                    model: puzzles
                    delegate: Label {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        text: colorSetName
                    }
                }
            }
        }
    }
}
