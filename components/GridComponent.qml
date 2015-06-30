import QtQuick 2.4
import Ubuntu.Components 1.2
import "../components/backend.js" as Logic
import U1db 1.0 as Udb
import Ubuntu.Components.Popups 1.0
//import QtMultimedia 5.0
import "../components/"


Column {
    spacing: units.gu(7)
    anchors {
        margins: units.gu(2)
        fill: parent
    }
    HeadComponent{
        height:units.gu(5)
        width:parent.width

    }

    AddComponent{
        id:dialog
    }

Column{
    width:parent.width
    height: width
    spacing:units.gu(4)
    onVisibleChanged: move.copy();


    Item{
        id:move
        property int toggle: 0;
        property bool swap: false;
        property int indexOne: 0;
        property int valueOne: 0;
        property int indexSecond: 0;
        property int valueSecond: 0;
        property var myArray: [0,0,0,0,0,0,0,0,0]
        property var correct: [0,1,2,3,4,5,6,7,8]
        property var myArray15: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
        property var correct15: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
        property var myArray25: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
        property var correct25: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]


        function swicth(index,value){
            if(move.swap === false){//haven't picked the first value
                move.indexOne = index;
                move.valueOne = value;
                move.swap = true;
                //playTone.play();
            }else{//already picked the first value
                move.indexSecond = index;
                move.valueSecond = value;
                move.swap = false;
                //playTone.play();
                if(level00.contents.stages[home.nulvl].size === 3){
                    move.myArray[indexOne] = valueSecond;
                    move.myArray[indexSecond] = valueOne;
                    move.arraysEqual(move.myArray, move.correct);
                    table.model = move.myArray;
                } else if(level00.contents.stages[home.nulvl].size === 5){
                    move.myArray25[indexOne] = valueSecond;
                    move.myArray25[indexSecond] = valueOne;
                    move.arraysEqual(move.myArray25, move.correct25);
                    table.model = move.myArray25;
                }else{
                    move.myArray15[indexOne] = valueSecond;
                    move.myArray15[indexSecond] = valueOne;
                    move.arraysEqual(move.myArray15, move.correct15);
                    table.model = move.myArray15;
                }
            }
        }
        function arraysEqual(arr, arr2) {
            for(var i = arr.length; i--;) {
                if(arr[i] !== arr2[i])
                    return false;
            }
            PopupUtils.open(dialog)
            //playSound.play();
            return true;
        }

        function copy(){
            if(level00.contents.stages[home.nulvl].size === 3){
                for(var x = 0; x< level00.contents.stages[home.nulvl].myArray.length; x++){
                    move.myArray[x] = level00.contents.stages[home.nulvl].myArray[x];
                }
                table.model = move.myArray
            } else if(level00.contents.stages[home.nulvl].size === 4) {
                for(var j = 0; j< level00.contents.stages[home.nulvl].myArray.length; j++){
                    move.myArray15[j] = level00.contents.stages[home.nulvl].myArray[j];
                }
                table.model = move.myArray15
            } else{
                for(var i = 0; i< level00.contents.stages[home.nulvl].myArray.length; i++){
                    move.myArray25[i] = level00.contents.stages[home.nulvl].myArray[i];
                }
                table.model = move.myArray25
            }
        }
        function reArray(){
            if(level00.contents.stages[home.nulvl].size === 3){
            for(var x = 0; x< move.myArray.length; x++){
               move.myArray[x] = level00.contents.stages[home.nulvl].myArray[x];
            }
            table.model = move.myArray;
            }else if(level00.contents.stages[home.nulvl].size === 5){
                for(var x = 0; x< move.myArray25.length; x++){
                   move.myArray25[x] = level00.contents.stages[home.nulvl].myArray[x];
                }
                table.model = move.myArray25;

            }else {
                for(var x = 0; x< move.myArray15.length; x++){
                   move.myArray15[x] = level00.contents.stages[home.nulvl].myArray[x];
            }
            table.model = move.myArray15;
            }
        }

    }

    GridView{
        id:table
        height:width
        width:parent.height < units.gu(60) ? parent.width : parent.height/1.8
        cellHeight: width/level00.contents.stages[home.nulvl].size
        cellWidth: cellHeight
        anchors.horizontalCenter: parent.horizontalCenter
        interactive: false
        model:level00.contents.stages[home.nulvl].myArray

        delegate:Item{
                    id:cellHolder
                    width: table.cellHeight; height: width
                    Rectangle {
                        id:cells
                        width: parent.width; height: width
                        property int cellIndex: parseInt(table.index)
                        color:Logic.whatColor(level00.contents.stages[home.nulvl].size,level00.contents.stages[home.nulvl].myColors[move.myArray[model.index]],level00.contents.stages[home.nulvl].myColors[move.myArray15[model.index]],level00.contents.stages[home.nulvl].myColors[move.myArray25[model.index]])
                        anchors.centerIn: parent
                        Behavior on width { NumberAnimation { duration: 250; easing: UbuntuAnimation.StandardEasing } }
                        Behavior on color {ColorAnimation {duration: UbuntuAnimation.SleepyDuration; easing: UbuntuAnimation.StandardEasing}}
                    }

                    Icon {
                        id:cellText
                        anchors.centerIn: parent
                        height:units.gu(2)
                        width:height
                        color: "#f0f0f0"
                        opacity:move.toggle
                        Behavior on opacity { NumberAnimation { property: "opacity"; duration: 250; easing: UbuntuAnimation.StandardEasing} }
                        name: Logic.whichIcon(parseInt(level00.contents.stages[home.nulvl].size),move.myArray,move.correct,move.myArray15,move.correct15,move.myArray25,move.correct25,model.index)
                    }
                        MouseArea{
                            anchors.fill: parent
                            visible:Logic.whichButton(parseInt(level00.contents.stages[home.nulvl].size),move.myArray,move.myArray15,move.myArray25,model.index)
                            onClicked: {
                                cells.focus = true;
                                cells.width >= cellHolder.width ? cells.width = cellHolder.width - units.gu(2) : cells.width = cellHolder.width;
                               //level00.contents.stages[home.nulvl].size === 3 ? move.swicth(model.index, move.myArray[parseInt(model.index)]) : move.swicth(model.index, move.myArray15[parseInt(model.index)]);
                                if(level00.contents.stages[home.nulvl].size ===3){
                                    move.swicth(model.index, move.myArray[parseInt(model.index)])
                                } else if(level00.contents.stages[home.nulvl].size ===4){
                                    move.swicth(model.index, move.myArray15[parseInt(model.index)])
                                }else {
                                    move.swicth(model.index, move.myArray25[parseInt(model.index)])
                                }
                            }
                        }
                }//end item
    }//end of gridview

    SetComponent{
        width:parent.width
        height:units.gu(5)
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
}


