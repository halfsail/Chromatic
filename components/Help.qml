import QtQuick 2.0
import Ubuntu.Components 1.1
import Ubuntu.Components.Popups 1.0
import "../components"

Component {
    id: dialogComponent
    Dialog {
        id: help
        title: "How to Play"
        property int counter: 0;

        Column{
            height:units.gu(25)
            width: units.gu(15)
            spacing:units.gu(3)

            Label{
                text:"Tap two blocks to swap them"
                anchors.horizontalCenter: parent.horizontalCenter

            }
            Label{
                text:"Move the blocks to the correct spots"
                anchors.horizontalCenter: parent.horizontalCenter

            }

            Label{
                text:"Corner blocks are always correct"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Label{
                text:"You get 10 hints every day"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Button {
            text: i18n.tr("Close")
            onClicked:{ PopupUtils.close(help)}
        }
    }
}
