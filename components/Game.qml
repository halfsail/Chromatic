import QtQuick 2.2
import Ubuntu.Components 1.1
import Ubuntu.Components.Popups 1.0
import "."

Column {
    spacing: units.gu(3)
    property var puzzles
    property alias currentPuzzle: header.currentPuzzle
    property string name: puzzles.get(currentPuzzle).colorSetName
    function onSolved() {
        PopupUtils.open(congratsDialog);
    }
    Header {
        // The header component is responsible for the current puzzle of the game
        id: header
        puzzles: parent.puzzles
    }
    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        text: name
    }
    GameGrid {
        id: grid
        height: width
        anchors.left: parent.left
        anchors.right: parent.right
        colorSetName: name
        size: puzzles.get(currentPuzzle).size
        onSolved: parent.onSolved
    }
    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: parent.width / 2.4
        LabelButton {
            source: Qt.resolvedUrl("../reset2.svg")
            MouseArea {
                anchors.fill: parent
                onClicked: grid.resetLevel();
            }
        }
        LabelButton {
            source: Qt.resolvedUrl("../hint2.svg")
            text: "10"
            MouseArea {
                anchors.fill: parent
                onPressed: grid.hinting = true;
                onReleased: grid.hinting = false;
            }
        }
    }
    Component {
        id: congratsDialog
        CongratsDialog {
            messages: ["Brilliant", "Excellent", "Magnificent", "Splendid", "spectacular", "Wonderful"]
            anchors.left: parent.left
            anchors.right: parent.right
            onDismissed: currentPuzzle++;
        }
    }
}