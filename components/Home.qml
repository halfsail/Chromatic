import QtQuick 2.4
import Ubuntu.Components 1.2
import "colors.js" as Colors
import "logic.js" as Logic


Page {
    //title: " "
    anchors.fill: parent
    signal playClicked
    signal helpClicked
    property int currentSet: 0
    property var colorSets: [
        Logic.generateInterpolatedArray(3, Colors.colors["Spellbound"]),
        Logic.generateInterpolatedArray(3, Colors.colors["#nofilter"]),
        Logic.generateInterpolatedArray(3, Colors.colors["Carribbean"]),
        Logic.generateInterpolatedArray(3, Colors.colors["Moar Whales"]),
        Logic.generateInterpolatedArray(3, Colors.colors["Your Lie In Apirl"]),
        Logic.generateInterpolatedArray(3, Colors.colors["Sunset"]),
        Logic.generateInterpolatedArray(3, Colors.colors["Raspberry Breve"]),
        Logic.generateInterpolatedArray(3, Colors.colors["Nolas"])
    ]
    Timer {
        interval: 3500
        running: true
        repeat: true
        onTriggered: currentSet = (currentSet + 1) % colorSets.length;
    }
    Grid {
        id: grid
        height: parent.height
        width: height
        anchors.horizontalCenter: parent.horizontalCenter
        columns: 3
        spacing: 0

        Repeater {
            model: 9
            Rectangle {
                width: grid.width / grid.columns
                height: width
                color: colorSets[currentSet][index]
                Behavior on color {
                    ColorAnimation {
                        duration: UbuntuAnimation.SleepyDuration
                        easing: UbuntuAnimation.StandardEasing
                    }
                }
            }
        }
    }
    Item {
        anchors.centerIn: parent
        width: play.width
        height: play.height
        Icon{
            id: play
            name: "media-playback-start"
            height: units.gu(3)
            width: units.gu(3)
            anchors.centerIn: parent
            color: "white"
        }
        /*Text {
            anchors.centerIn: parent
            text: ">"
            color: "white"
        }*/
        MouseArea {
            anchors.fill: parent
            onClicked: playClicked();
        }
    }
    Item {
        width: grid.width / grid.columns
        height: width
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        Label {
            id: chromatic
            text: "Chromatic"
            fontSize: "x-large"
            font.weight: Font.Light
            font.letterSpacing: units.gu(0.5)
            color: "white"
            anchors.centerIn: parent
        }
        Label {
            text: "relating to colors"
            fontSize: "small"
            color: "white"
            anchors.horizontalCenter: chromatic.horizontalCenter
            anchors.top: chromatic.bottom
            anchors.topMargin: units.gu(2)
        }
    }
    Column{
        anchors{
            bottom:parent.bottom
            bottomMargin: units.gu(2)
            horizontalCenter: parent.horizontalCenter
        }

        Item {
            width: grid.width / grid.columns
            height: width/3
            Label {
                text: "How to play"
                fontSize: "large"
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            MouseArea {
                anchors.fill: parent
                onClicked: helpClicked();
            }
        }
        Item {
            width: grid.width / grid.columns
            height: width/3
            Label {
                text: "Credits"
                fontSize: "large"
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            MouseArea {
                anchors.fill: parent
                onClicked: stack.push(credits)
            }
        }
    }
}
