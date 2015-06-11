import QtQuick 2.0
import Ubuntu.Components 1.1
import U1db 1.0 as U1db

Item{

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
                home.nulvl= home.nulvl-1;
                move.copy()
            }//stack.push(set)
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
            text: "Level " + (home.nulvl + 1)
            //color:"#5f5f5f"
            color:"#5f5f5f"
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
    Icon{
        id:settingButton2
        name:"go-next"
        width: height
        visible: home.nulvl === level00.contents.stages.length-1 || userSettings.contents.nulvl <= home.nulvl ? opacity = .5 : opacity = 1;//home.nulvl === 1 ? opacity = .5 : opacity = 1;
        height:diyHeader.height/1.3
        anchors{right:parent.right; verticalCenter: parent.verticalCenter}
        MouseArea {
            visible: home.nulvl === level00.contents.stages.length-1 || userSettings.contents.nulvl <= home.nulvl ? false : true;
            anchors.centerIn: parent
            height:units.gu(5)
            width:height
            onClicked: {
                //userSettings.contents.nulvl <= home.nulvl? home.nulvl = home.nulvl:home.nulvl=home.nulvl+1;
                home.nulvl= home.nulvl+1;
                move.copy()
                //level00.contents.stages[nulvl].size === 3? table.model = move.myArray : table.model = move.myArray15;
            }//stack.push(set)
        }
    }

}
