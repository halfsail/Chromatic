import QtQuick 2.2
import Ubuntu.Components 1.1
import "backend.js" as Logic
import "colors.js" as Colors

Grid {
    id: grid
    width: parent.width
    height: parent.height
    property int size: 4
    property string colorSetName: "Magia"
    property var colors: Logic.generateInterpolatedArray(size, Colors.colors[colorSetName])
    property var indexMap: Logic.generateRandomizedArray(size)
    onIndexMapChanged: checkSolved(indexMap)
    property var selectedSquare: null
    columns: size
    rows: size
    spacing: 0
    function checkSolved(arr) {
        return Logic.all(function(i, val) {return val == i}, arr);
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
        model: 16
        Rectangle {
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
            }
        }
    }
}