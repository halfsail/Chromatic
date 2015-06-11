import QtQuick 2.0
import Ubuntu.Components 1.1
import Ubuntu.Components.Popups 1.0
import "../components"
import "../components/backend.js" as Logic

Component {
    id: dialogComponent
   Popover {
        id: dialog
        opacity:.5
        Item{
            id:wrapper
            height:units.gu(15)
            width:parent.width
            property var congrats: ["Brilliant","Excellent","Magnificent","Splendid","spectacular","Wonderful"];
        Column{
            height:units.gu(10)
            width:parent.width
            spacing:units.gu(3)
            anchors.margins: units.gu(2)
            anchors.centerIn: parent
            Label{
                text:wrapper.congrats[Logic.congrats(4)]
                fontSize: "large"
                font.weight: Font.Light
                font.letterSpacing: units.gu(.3)
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Icon{
                name:"media-playback-start"
                height:units.gu(3)
                width:units.gu(3)
                anchors.horizontalCenter: parent.horizontalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked:{

                        userSettings.contents.nulvl === home.nulvl?home.nulvl=home.nulvl: home.nulvl=home.nulvl+1;
                        move.copy()
                        //table.model = move.myArray;
                        //add.addRoll({"sides":parseInt(pick.model[pick.selectedIndex]),"roll":0});
                        PopupUtils.close(dialog)
                    }
                }
            }

        }
        }

    }
}
