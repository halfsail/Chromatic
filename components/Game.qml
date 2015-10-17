import QtQuick 2.2
import Ubuntu.Components 1.1
import "."
import "puzzles.js" as Puzzles

Column {
    spacing: units.gu(3)
    anchors.fill: parent
    anchors.margins: units.gu(2)
    property var puzzles: Puzzles.puzzles
    property int currentPuzzle: 0
    property string name: puzzles[currentPuzzle].colorSet
    function onSolved() {
        console.log("woot");
        currentPuzzle++;
    }
    function onBack() {currentPuzzle--}
    function onForward() {currentPuzzle++}
    Header {
        currentPuzzle: parent.currentPuzzle
        numPuzzles: puzzles.length
        onBack: parent.onBack;
        onForward: parent.onForward;
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
        size: puzzles[currentPuzzle].size
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
}