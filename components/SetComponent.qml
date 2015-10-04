import QtQuick 2.2
import Ubuntu.Components 1.2
import "../components/backend.js" as Logic
import "../components"
import U1db 1.0 as U1db

Item{
    id:col
    height:units.gu(5)
    width: parent.width


    function reArray(){
        for(var x = 0; x< level.contents.stages[0].myArray.length; x++){
            //console.log(level.contents.stages[0].myArray[x])
            //console.log(level.contents.stages[1].myColors[x])
        }
        //table.model = grid.myArray;
    }

    Row{
        height:parent.height
        //width:parent.width
        spacing: parent.width/2.4
        anchors.centerIn: parent
        //anchors.horizontalCenter: parent.horizontalCenter
        Item{
            height:units.gu(2.8)
            width:height
        Icon{
            //name:"reset"
            source: Qt.resolvedUrl("../reset2.svg")
            height:parent.width//units.gu(2.8)
            width:height
            anchors.verticalCenter: parent.verticalCenter
            MouseArea{
                height:parent.width+units.gu(3)
                width:height
                anchors.centerIn: parent
                onClicked: {
                    Haptics.play()
                    move.reArray();
                }
            }
        }
        }
        Item{
            height:units.gu(2.8)
            width:height
            Icon{
                id:hint
                //name:"torch-off"
                source: Qt.resolvedUrl("../hint2.svg")
                height:parent.height//units.gu(2.8)
                width:height
                focus:false
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    height:parent.width+units.gu(3)
                    width:height
                    visible: userSettings.contents.hint === 0? false:true;

                    anchors.centerIn: parent

                    onPressed:move.toggle = 1;
                    onReleased:{
                        Haptics.play()
                        move.toggle = 0;
                        userSettings.contents.hint === 0? userSettings.contents ={"nulvl": userSettings.contents.nulvl, "day": userSettings.contents.day, "hint": userSettings.contents.hint} :userSettings.contents ={"nulvl": userSettings.contents.nulvl, "day": userSettings.contents.day, "hint": userSettings.contents.hint-1};
                    }
                }
            }
            Label{
                anchors{
                    horizontalCenter: parent.horizontalCenter
                    top:hint.bottom
                }
                text:userSettings.contents.hint === 0? text = "No More Today" : userSettings.contents.hint;
                fontSize:"small"
            }
        }
    }



}



