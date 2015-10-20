import QtQuick 2.2
import Ubuntu.Components 1.1

Page {
    JsonModel {
        id: puzzlesModel
        source: "puzzles.json"
        onLoadCompleted: gameLoader.sourceComponent = gameComponent;
    }
    Component {
        id: gameComponent
        Game {
            puzzles: puzzlesModel
            onMenuClicked: pageStack.pop()
        }
    }
    Loader {
        // We need to delay the displaying of the game grid until the data is
        // loaded from the json file, because it happens asynchronously
        id: gameLoader
        anchors.fill: parent
        anchors.margins: units.gu(2)
    }
}