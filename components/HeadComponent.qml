import QtQuick 2.2
import Ubuntu.Components 1.1
import Ubuntu.Components.Popups 1.0
import U1db 1.0 as U1db
import "../components/"


Item{
    Icon{
        id:menu
        name:"navigation-menu"
        width: height
        height:diyHeader.height/1.3
        anchors{left:parent.left; verticalCenter: parent.verticalCenter}
        MouseArea {
            anchors.centerIn: parent
            height:units.gu(5)
            width:height
            onClicked: {
                Haptics.play()
               stack.push(home)
            }
        }
    }



Item{
    width:parent.width/1.7
    anchors{
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
    }

    Icon{
        id:settingButton
        name:"back"
        width: height
        visible: home.nulvl === 0 ? opacity = .5 : opacity = 1;
        height:diyHeader.height/1.3
        anchors{left:parent.left; verticalCenter: parent.verticalCenter}
        MouseArea {
            visible: home.nulvl === 0 ? false : true;
            anchors.centerIn: parent
            height:units.gu(5)
            width:height
            onClicked: {
                Haptics.play()
                home.nulvl= home.nulvl-1;
                move.copy()
            }
        }
    }

    Item { // container for the custom header include settings, title and add
        id:diyHeader
        anchors.centerIn: parent
        height:diyTitle.height // set in main.qml
        width:parent.width
        Label { //calorie title for app
            id:diyTitle
            fontSize:"x-large"
            font.weight: Font.Light;
            anchors.centerIn: parent;
            text:"Level " + (home.nulvl + 1)
            color:"#5f5f5f"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    Haptics.play()
                    PopupUtils.open(popoverComponent, diyTitle)
                }
            }
        }
        Label{

            text:level00.contents.stages[home.nulvl].name
            anchors{
                horizontalCenter: parent.horizontalCenter
                top:parent.bottom
                topMargin:units.gu(2)

            }
        }
    }

    Component {
            id: popoverComponent
            Popover {
                id: popover
                pointerTarget:parent
                /*ListView{
                    id:table
                    clip:true
                    height:units.gu(30)
                    width:parent.width
                    opacity:.8
                    model:userSettings.contents.nulvl+1
                    delegate: ListItem{
                        Label{
                            text:"lvl " + (model.index+1) + "     " + level00.contents.stages[model.index].name
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left:parent.left; anchors.leftMargin: units.gu(3)
                        }
                        onClicked:{
                            Haptics.play()
                            home.nulvl = model.index
                            move.copy()
                            PopupUtils.close(popover)
                        }
                    }
                }*/
            }
    }


    Icon{
        id:settingButton2
        name:"go-next"
        width: height
        height:diyHeader.height/1.3
        visible: home.nulvl === level00.contents.stages.length-1 || userSettings.contents.nulvl <= home.nulvl ? opacity = .5 : opacity = 1;
        anchors{right:parent.right; verticalCenter: parent.verticalCenter}
        MouseArea {
            visible: home.nulvl === level00.contents.stages.length-1 || userSettings.contents.nulvl <= home.nulvl ? false : true;
            anchors.centerIn: parent
            height:units.gu(5)
            width:height
            onClicked: {
                Haptics.play()
                home.nulvl= home.nulvl+1;
                move.copy()
            }
        }
    }

}
}
