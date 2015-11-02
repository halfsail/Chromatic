import QtQuick 2.2
import Ubuntu.Components 1.1
import "logic.js" as Logic
import "colors.js" as Colors

Grid {
    id: grid
    anchors.left: parent.left
    anchors.right: parent.right
    signal solved
    signal moved
    property int size
    // FIXME: size change doesn't currently trigger a randomsiation for
    // efficiency, assuming that each consequtive puzzle uses a different colour
    // set
    property string colorSetName
    property var colors: Logic.generateInterpolatedArray(size, Colors.colors[colorSetName])
    property var indexMap
    onIndexMapChanged: Logic.isSolved(indexMap) ? solved() : moved()
    property var startingIndexMap
    property var selectedSquare: null
    property bool hinting: false
    property bool showCornerHints: hinting
    property real hintOpacity: 0.8
    property bool enabled: true
    columns: size
    rows: size
    spacing: 0
    function initialiseLevel() {
        indexMap = Logic.generateRandomizedArray(size);
        startingIndexMap = indexMap;
    }
    function resetLevel() {
        indexMap = startingIndexMap;
    }
    function swapIndexes(a, b) {
        var arr = indexMap.slice();
        Logic.swap(arr, a, b);
        return arr;
    }
    function onSquareSelected(square) {
        if (square === selectedSquare) {
            // Deslect currently selected square
            selectedSquare.selected = false;
            selectedSquare = null;
        } else if (! Logic.isCorner(square.n, grid.size)) {
            if (selectedSquare == null) {
                // Select a new first square
                square.selected = true;
                selectedSquare = square;
            } else {
                // Execute a swap
                indexMap = swapIndexes(selectedSquare.n, square.n);
                selectedSquare.selected = false;
                selectedSquare = null;
            }
        }
    }
    Repeater {
        model: grid.size * grid.size
        Item {
            id: square
            property int n: index  // can't call this index due to scope clash :-(
            width: grid.width / grid.columns
            height: grid.height / grid.rows
            property bool selected: false
            MouseArea {
                enabled: grid.enabled
                anchors.fill: parent
                onClicked: grid.onSquareSelected(square);
            }
            Rectangle {
                color: grid.colors[grid.indexMap[index]]
                anchors.fill: square
                anchors.margins: selected ? parent.width / 10 : 0
                Behavior on anchors.margins {
                    NumberAnimation {
                        duration: UbuntuAnimation.SnapDuration
                        easing: UbuntuAnimation.StandardEasing
                    }
                }
                Behavior on color {
                    ColorAnimation {
                        duration: UbuntuAnimation.SleepyDuration
                        easing: UbuntuAnimation.StandardEasing
                    }
                }
            }
            function selectHint() {
                if (Logic.isCorner(index, grid.size)) {
                    return "l"; // lock
                } else if (index == grid.indexMap[index]) {
                    return "y"; // ok
                } else {
                    return "n"; // close
                }

            }
            function getHintOpacity(hinting, showCornerHints) {
                if (Logic.isCorner(index, grid.size)) {
                    // Corner hints are special because they help displays the
                    // in isolation
                    return showCornerHints ? hintOpacity : 0;
                } else {
                    return hinting ? hintOpacity : 0;
                }
            }
            Text {
                text: selectHint();
                anchors.centerIn: square
                color: Logic.hexColorIsBright(grid.colors[grid.indexMap[index]]) ? "black" : "white"
                opacity: getHintOpacity(hinting, showCornerHints);
                Behavior on opacity {
                    NumberAnimation {
                        duration: UbuntuAnimation.SleepyDuration
                        easing: UbuntuAnimation.StandardEasing
                    }
                }
            }
        }
    }
}