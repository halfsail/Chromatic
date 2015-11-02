import QtQuick 2.2
import Ubuntu.Components 1.1
import Ubuntu.Components.Popups 1.0

Page {
    property var instructions: [
        {
            text: "Chromatic is a game about colors and how they relate to each other",
            button: true
        },
        {
            text: "Each level comes scambled and your goal is to fix the grid",
            button: true, resetLevel: true
        },
        {
            text: "The corner blocks are always correct so they can't move",
            button: true, showCornerHints: true
        },
        {
            text: "Tap any two other blocks to swap their positions",
            gridActive: true, gridChangeAdvance: true
        },
        {
            text: "If you are stuck press and hold this icon for a hint",
            hintButton: true, showCornerHints: grid.hinting,
            hintReleaseAdvance: true
        },
        {
            text: "Use them wisely, you only get 10 hints per day",
            button: true, hintButton: true, showCornerHints: grid.hinting
        },
        {
            text: "That is it! Feel free to try and beat this tutorial level.",
            gridActive: true, hintButton: true, showCornerHints: grid.hinting
        }
    ]
    function onComplete() {
        // Because of early binding of actions, instructions can be undefined
        var numStages = instructions ? instructions.length - 1 : null
        if (stage == numStages) {
            PopupUtils.open(successDialog);
        }
    }
    property int stage: 0
    property var instruction: instructions[stage]
    Column {
        spacing: units.gu(4)
        anchors.fill: parent
        anchors.margins: units.gu(2)
        Item {
            anchors.left: parent.left
            anchors.right: parent.right
            height: label.height
            Label {
                id: label
                text: "How to play"
                fontSize: "x-large"
                font.weight: Font.Light
                anchors.centerIn: parent
            }
            Text {
                text: "[]"
                anchors.left: parent.left
                MouseArea {
                    anchors.fill: parent
                    onClicked: pageStack.pop()
                }
            }
        }
        GameGrid {
            id: grid
            height: width
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: units.gu(3)
            anchors.rightMargin: anchors.leftMargin
            colorSetName: "Tutorial"
            size: 3
            enabled: instruction.gridActive ? true : false
            onColorSetNameChanged: null
            startingIndexMap: [0, 3, 2, 1, 7, 4, 6, 5, 8]
            indexMap: [0, 1, 2, 3, 4, 5, 6, 7, 8]
            onMoved: instruction.gridChangeAdvance ? stage++ : null;
            onSolved: onComplete();
            hinting: instruction.hinting ? true : false
            showCornerHints: instruction.showCornerHints ? true : false
        }
        Image {
            height: instruction.hintButton ? units.gu(2.8) : 0
            width: height
            anchors.horizontalCenter: parent.horizontalCenter
            source: "../hint2.svg"
            opacity: instruction.hintButton ? 1 : 0
            Behavior on height {
                NumberAnimation {
                    duration: UbuntuAnimation.SnapDuration
                    easing: UbuntuAnimation.StandardEasing
                }
            }
            Behavior on opacity {
                NumberAnimation {
                    duration: UbuntuAnimation.SnapDuration
                    easing: UbuntuAnimation.StandardEasing
                }
            }
            MouseArea {
                anchors.fill: parent
                onPressed: grid.hinting = true;
                onReleased: {
                    grid.hinting = false;
                    if (instruction.hintReleaseAdvance) {
                        stage++;
                    }
                }
            }
        }
        Label {
            id: helpText
            text: instruction.text
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: units.gu(2)
            anchors.rightMargin: anchors.leftMargin
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
        }
        Button {
            width: parent.width / 1.8
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Got it"
            opacity: instruction.button ? 1 : 0
            onClicked: {
                stage++;
                if (instruction.resetLevel) {
                    grid.resetLevel();
                }
            }
            Behavior on opacity {
                NumberAnimation {
                    duration: UbuntuAnimation.SnapDuration
                    easing: UbuntuAnimation.StandardEasing
                }
            }
        }
    }
    Component {
        id: successDialog
        CongratsDialog {
            messages: ["You beat the tutorial"]
            onDismissed: pageStack.pop();
        }
    }
}