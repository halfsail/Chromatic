import QtQuick 2.2
import Ubuntu.Components 1.1
import "backend.js" as Logic
import "colors.js" as Colors

Grid {
    id: grid
    anchors.left: parent.left
    anchors.right: parent.right
    property int size
    // FIXME: size change doesn't currently trigger a randomsiation for
    // efficiency, assuming that each consequtive puzzle uses a different colour
    // set
    property string colorSetName
    onColorSetNameChanged: initiaiseLevel()
    property var colors: Logic.generateInterpolatedArray(size, Colors.colors[colorSetName])
    property var indexMap
    onIndexMapChanged: checkSolved(indexMap)
    property var startingIndexMap
    property var onSolved
    property var selectedSquare: null
    property bool hinting: false
    columns: size
    rows: size
    spacing: 0
    function initiaiseLevel() {
        indexMap = Logic.generateRandomizedArray(size);
        startingIndexMap = indexMap;
    }
    function resetLevel() {
        indexMap = startingIndexMap;
    }
    function checkSolved(arr) {
        if (Logic.all(function(i, val) {return val == i}, arr)) {
            onSolved();
        }
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
            Text {
                text: selectHint();
                anchors.centerIn: square
                color: Logic.hexColorIsBright(grid.colors[grid.indexMap[index]]) ? "black" : "white"
                opacity: grid.hinting ? 1 : 0
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