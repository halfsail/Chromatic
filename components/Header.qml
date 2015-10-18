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
                onClicked: active ? currentPuzzle-- : null;
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
                onClicked: PopupUtils.open(levelListComponent, parent)
            }
        }
        Text {
            // FIXME: icon
            property bool active: currentPuzzle < puzzles.count
            onActiveChanged: forward.enabled = active
            text: ">"
            opacity: active ? 1 : inactiveOpacity
            anchors.verticalCenter: label.verticalCenter
            MouseArea {
                id: forward
                anchors.fill: parent
                onClicked: active ? currentPuzzle++ : null;
            }
        }
        Component {
            id: levelListComponent
            Popover {
                id: levelListPopover
                ListView {
                    height: units.gu(30)
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: units.gu(1)
                    anchors.rightMargin: units.gu(1)
                    clip: true
                    model: puzzles
                    delegate: Item {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height: lvl.height
                        Row {
                            spacing: units.gu(2)
                            Label {
                                id: lvl
                                text: "lvl " + (index + 1)
                            }
                            Label {
                                text: colorSetName
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                currentPuzzle = index;
                                PopupUtils.close(levelListPopover);
                            }
                        }
                    }
                }
            }
        }
    }
}
