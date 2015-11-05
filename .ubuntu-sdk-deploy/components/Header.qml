import QtQuick 2.4
import Ubuntu.Components 1.2
import Ubuntu.Components.Popups 1.0

Item {
    property int currentPuzzle
    property int maxPuzzle
    property var puzzles
    property var onBack
    property var onForward
    signal menuClicked
    anchors.left: parent.left
    anchors.right: parent.right
    height: label.height
    property real inactiveOpacity: 0.3
    ListModel {
        // We make a sliced copy of the puzzles model for listing only those
        // that are actually accessible to the player
        id: activePuzzles
    }
    onMaxPuzzleChanged: {
        for (var i = activePuzzles.count; i <= maxPuzzle; i++) {
            activePuzzles.append(puzzles.get(i));
        }
    }
    /*Text {
        text: "[]"
        anchors.verticalCenter: parent.verticalCenter
        MouseArea {
            anchors.fill: parent
            onClicked: menuClicked();
        }
    }*/
    Icon {
        name:"navigation-menu"
        anchors.verticalCenter: parent.verticalCenter
        height:label.height
        width:height
        MouseArea {
            anchors.fill: parent
            onClicked: menuClicked();
        }
    }

    Row {
        spacing: units.gu(1)
        anchors.horizontalCenter: parent.horizontalCenter
        Icon {
            // FIXME: icon
            property bool active: currentPuzzle > 0
            onActiveChanged: back.enabled = active
            name:"back"
            height:label.height
            width:height
            //text: "<"
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
                onClicked: activePuzzles.count > 1 ? PopupUtils.open(levelListComponent, parent) : null
            }
        }
        Icon {
            // FIXME: icon
            property bool active: currentPuzzle > maxPuzzle
            onActiveChanged: forward.enabled = active
            name:"next"
            //text: ">"
            height:label.height
            width:height
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
                UbuntuListView {
                    height: units.gu(30)
                    width:parent.width
                    anchors.leftMargin: units.gu(2)
                    anchors.rightMargin: units.gu(2)
                    clip: true
                    model: activePuzzles
                    delegate: ListItem {
                        width:parent.width
                        height:units.gu(5)
                            Label {
                                id: lvl
                                text: "lvl " + (index + 1)
                                anchors{
                                    left:parent.left; leftMargin: units.gu(2)
                                    verticalCenter: parent.verticalCenter
                                }
                            }
                            Label {
                                text: colorSetName
                                anchors{
                                    right:parent.right; rightMargin: units.gu(2)
                                    verticalCenter: parent.verticalCenter
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
