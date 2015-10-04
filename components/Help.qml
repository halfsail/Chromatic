import QtQuick 2.2
import Ubuntu.Components 1.1
import Ubuntu.Components.Popups 1.0
import "../components/backend.js" as Logic
import "../components"


Page {
    title: ""//"How To Play"
    id: settings
    visible: false
    onVisibleChanged: place.copy();

    Item{
        id:place
        property int toggle: 0;
        property bool swap: false;
        property int holder: 0;
        property int indexOne: 0;
        property int valueOne: 0;
        property int indexSecond: 0;
        property int valueSecond: 0;
        property var myArray: [0,0,0,0,0,0,0,0,0]
        property var masterArr: [0,1,2,3,4,5,6,7,8]
        property var arr1: [0,4,2,1,7,5,6,3,8]
        property var messedArr: ["#1ccb90","#cccccc","#590066","#8de29e","#cccccc","#a83a86","#fffaad","#cccccc","#f874a6"]
        property var arrColor: ["#1ccb90","#3a657b","#590066","#8de29e","#9a8e92","#a83a86","#fffaad","#fbb7a9","#f874a6"]

        function textChange(value){
            if(value === 1){
                table.model = place.arr1;
                return "Each level comes scambled and your goal is to fix the grid"
            } else if(value === 2){
                 return "Tap any two blocks to swap them into the correct positions"
            }else if(value === 3){
                 return "The corner blocks are always correct so they are not movable"
            }else if(value === 4){
                 return "If you are stuck press and hold this icon for a hint."
            }else if(value === 5){
                return "Use them wisely you only get 10 hints per day"
            }else if(value === 6){
                return "That is it! Feel free to try and beat this tutorial level."
            }else{
                return "Chromatic is a game about colors and how they relate to each other"
            }
        }

        function swicth(index,value){
            if(place.swap === false){//haven't picked the first value
                place.indexOne = index;
                place.valueOne = value;
                place.swap = true;

            }else{//already picked the first value
                place.indexSecond = index;
                place.valueSecond = value;
                place.swap = false;

                place.myArray[indexOne] = valueSecond;
                place.myArray[indexSecond] = valueOne;
                place.arraysEqual(place.myArray, place.masterArr)
                table.model = place.myArray;

                if(place.holder === 2){place.holder = place.holder +1;}
            }
        }
        function arraysEqual(arr, arr2) {
            for(var i = arr.length; i--;) {
                if(arr[i] !== arr2[i])
                    return false;
            }
            PopupUtils.open(dialog)
            return true;
        }
        function copy(){
            for(var x = 0; x< 9; x++){
                    place.myArray[x] = place.arr1[x];
                }
                table.model = place.myArray
        }
     }
    Column{
        spacing: units.gu(4)
        anchors {
            margins: units.gu(2)
            fill: parent
        }
        Item{
            width:parent.width
            height:units.gu(3)
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
                        place.holder = 0;
                       stack.push(home)
                    }
                }
            }
            Label{
                text:"How To Play"
                fontSize:"x-large"
                font.weight: Font.Light;
                anchors.centerIn: parent;
            }
        }

        Component {
                 id: dialog

                 Popover {
                     id: dialogue
                    Item{
                        height:units.gu(15)
                        width:parent.width
                        Column{
                            spacing:units.gu(3)
                            anchors{
                                fill:parent
                                margins:units.gu(3)
                            }
                         Label{
                             text:"You Beat The Tutorial"
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
                                     Haptics.play()
                                     PopupUtils.close(dialogue)
                                     place.holder = 0;
                                     pageStack.push(home)
                                 }
                             }
                         }
                        }
                    }

                 }
            }

    GridView{
        id:table
        height:width
        width:parent.width/1.2//parent.height/2 < units.gu(60) ? parent.width : parent.height/1.8
        cellHeight: width/3
        cellWidth: cellHeight
        anchors.horizontalCenter: parent.horizontalCenter
        interactive: false
        model:place.Arr1
        delegate:Item{
                    id:cellHolder
                    width: table.cellHeight; height: width
                    Rectangle {
                        id:cells
                        width: parent.width; height: width
                        property int cellIndex: parseInt(table.index)
                        color:place.holder === 0 ? place.arrColor[place.masterArr[model.index]] : place.arrColor[place.myArray[model.index]];
                        anchors.centerIn: parent
                        Behavior on width { NumberAnimation { duration: 250; easing: UbuntuAnimation.StandardEasing } }
                        Behavior on color {ColorAnimation {duration: UbuntuAnimation.SleepyDuration; easing: UbuntuAnimation.StandardEasing}}
                    }
                    Icon {
                        id:locks
                        anchors.centerIn: parent
                        height:units.gu(2)
                        width:height
                        color: "#f0f0f0"
                        opacity: place.holder === 3 && model.index === 0 || place.holder === 3 && model.index === 2 || place.holder === 3 && model.index === 6 || place.holder === 3 && model.index === 8? 1 : 0
                        Behavior on opacity { NumberAnimation { property: "opacity"; duration: 250; easing: UbuntuAnimation.StandardEasing} }
                        name:"lock"//place.myArray[0] === 0 ||place.myArray[3] === 3 || place.myArray[6] === 6 || place.myArray[8] === 8  ? "lock" : "";
                    }

                    Icon {
                        id:cellText
                        anchors.centerIn: parent
                        height:units.gu(2)
                        width:height
                        color: "#f0f0f0"
                        opacity:place.toggle
                        Behavior on opacity { NumberAnimation { property: "opacity"; duration: 250; easing: UbuntuAnimation.StandardEasing} }
                        name: Logic.whichIcon(3,place.myArray,place.masterArr,place.myArray15,place.correct15,place.myArray25,place.correct25,model.index)
                    }
                        MouseArea{
                            anchors.fill: parent
                            visible: place.holder < 2 ? false:true;
                            //visible: place.holder < 2 && model.index === 0 || place.holder < 2 && model.index === 2 || place.holder < 2 && model.index === 6 || place.holder < 2 && model.index === 8? false:true;
                            onClicked: {
                                Haptics.play()
                                if(model.index === 0 || model.index === 2 || model.index === 6 || model.index === 8){
                                    //do nothing
                                }else {
                                    cells.width >= cellHolder.width ? cells.width = cellHolder.width - units.gu(2) : cells.width = cellHolder.width;
                                    place.swicth(model.index, place.myArray[parseInt(model.index)])
                                }
                            }
                        }
                }//end item
    }//end of gridview

    Item{
        height:place.holder >= 4? units.gu(2.8) : units.gu(0)
        width:height
        opacity: place.holder >= 4? 1 : 0;
        Behavior on height { NumberAnimation { duration: 250; easing: UbuntuAnimation.StandardEasing } }
        Behavior on opacity { NumberAnimation { duration: 250; easing: UbuntuAnimation.StandardEasing } }
        anchors.horizontalCenter: parent.horizontalCenter
        Icon{
            id:hint
            source: Qt.resolvedUrl("../hint2.svg")
            height:parent.height//units.gu(2.8)
            width:height
            anchors.verticalCenter: parent.verticalCenter
            MouseArea{
                height:parent.width+units.gu(3)
                width:height
                anchors.centerIn: parent
                onPressed:{
                    Haptics.play()
                    place.toggle = 1;
                }
                onReleased:{
                    place.toggle = 0;
                    if(place.holder === 4){
                        place.holder=place.holder +1;
                    }
                }
            }
        }
    }
    Label{
        id:texthelp
        text:place.textChange(place.holder)
        width: parent.width/1.3
        anchors.horizontalCenter: parent.horizontalCenter
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter

    }
    Button{
        id:clickThis
        width:parent.width/1.8
        anchors.horizontalCenter: parent.horizontalCenter
        visible: place.holder <6 ? true : false
        text:"Got it"
        onClicked: {
            Haptics.play()
            if(place.holder >= 6){
                place.holder = 0;
                pageStack.push(home)
            }else{
                place.holder = place.holder + 1;
            }
        }

    }
    }


}
