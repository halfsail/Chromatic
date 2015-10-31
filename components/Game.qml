import QtQuick 2.2
import Ubuntu.Components 1.1
import Ubuntu.Components.Popups 1.0
import U1db 1.0 as U1db
import "."

Column {
    spacing: units.gu(3)
    property var puzzles
    property alias currentPuzzle: header.currentPuzzle
    property alias maxPuzzle: header.maxPuzzle
    onMaxPuzzleChanged: {
        var newContents = persistentState.contents;
        newContents["nulvl"] = maxPuzzle;
        persistentState.contents = newContents;
    }
    property string name: puzzles.get(currentPuzzle).colorSetName
    signal menuClicked
    U1db.Database {
        id: persistentStateDB
        path: "pallete.u1db"
    }
    U1db.Document {
        id: persistentState
        database: persistentStateDB
        docId: "uSet"
        create: true
        defaults: {
            "nulvl": 0,
            "day": 0,
            "hint": 10
        }
    }
    Timer {
        interval: 60000
        running: true
        repeat: true
        property int dayMillisecs: 1000 * 60 * 60 * 24
        onTriggered: {
            var now = new Date().getTime();
            if (now - persistentState.contents.day > dayMillisecs) {
                var newContents = persistentState.contents;
                newContents["day"] = now;
                newContents["hint"] = 10;
                persistentState.contents = newContents;
            }
        }
    }
    Header {
        // The header component is responsible for the current puzzle of the game
        id: header
        puzzles: parent.puzzles
        currentPuzzle: persistentState.contents.nulvl
        maxPuzzle: persistentState.contents.nulvl
        onMenuClicked: parent.menuClicked();
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
        onColorSetNameChanged: grid.initialiseLevel()
        size: puzzles.get(currentPuzzle).size
        onSolved: currentPuzzle + 1 == puzzles.count ? PopupUtils.open(finishedDialog) : PopupUtils.open(congratsDialog);
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
            text: active ? persistentState.contents.hint : "No more today"
            property bool active: persistentState.contents.hint > 0
            onActiveChanged: {
                hint.enabled = active;
            }
            MouseArea {
                id: hint
                anchors.fill: parent
                onPressed: grid.hinting = true;
                onReleased: {
                    grid.hinting = false;
                    var newContents = persistentState.contents;
                    newContents["hint"] = newContents["hint"] - 1;
                    persistentState.contents = newContents;
                }
            }
        }
    }
    Component {
        id: congratsDialog
        CongratsDialog {
            messages: ["Brilliant", "Excellent", "Magnificent", "Splendid", "Spectacular", "Wonderful"]
            anchors.left: parent.left
            anchors.right: parent.right
            onDismissed: {
                currentPuzzle++;
                maxPuzzle = Math.max(currentPuzzle, maxPuzzle);
            }
        }
    }
    Component {
        id: finishedDialog
        CongratsDialog {
            messages: ["Thank you for playing"]
            anchors.left: parent.left
            anchors.right: parent.right
            onDismissed: pageStack.pop();
        }
    }
}
