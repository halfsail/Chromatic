import QtQuick 2.2
import Ubuntu.Components 1.1
import Ubuntu.Components.Popups 1.0
import "./backend.js" as Logic

Popover {
    id: popover
    property var messages
    signal dismissed
    onVisibleChanged: visible ? undefined : dismissed();
    Column {
        anchors.margins: units.gu(1)
        anchors.left: parent.left
        anchors.right: parent.right
        spacing: units.gu(3)
        Item {
            // FIXME: need better way to do margins here
            height: units.gu(0.5)
            width: height
        }
        Label {
            text: Logic.choose(messages)
            anchors.horizontalCenter: parent.horizontalCenter
            fontSize: "large"
            font.weight: Font.Light
            font.letterSpacing: units.gu(0.3)
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: ">"
        }
        Item {
            height: units.gu(0.5)
            width: height
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: PopupUtils.close(popover);
    }
}
