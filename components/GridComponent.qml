import QtQuick 2.0
import Ubuntu.Components 1.1
import "../components/backend.js" as Logic
import U1db 1.0 as Udb
import Ubuntu.Components.Popups 1.0
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
    Component.onCompleted: {move.copy();}

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


        function swicth(index,value){
            if(move.swap === false){//haven't picked the first value
                move.indexOne = index;
                move.valueOne = value;
                move.swap = true;
                //playSound.play()
            }else{//already picked the first value
                move.indexSecond = index;
                move.valueSecond = value;
                move.swap = false;
                //playSound.play()
                if(level00.contents.stages[home.nulvl].size === 3){
                    move.myArray[indexOne] = valueSecond;
                    move.myArray[indexSecond] = valueOne;
                    move.arraysEqual(move.myArray, move.correct);
                    table.model = move.myArray;
                } else{
                    move.myArray15[indexOne] = valueSecond;
                    move.myArray15[indexSecond] = valueOne;
                    move.arraysEqual(move.myArray15, move.correct15);
                    table.model = move.myArray15;
                }
            }
        }
        function arraysEqual(arr, arr2) {
            print("enter")

            print("arry " +  arr.length + " arry2 " + arr2.length)
            for(var i = arr.length; i--;) {
                if(arr[i] !== arr2[i])
                    return false;
            }

            if(home.nulvl === userSettings.contents.nulvl){
                userSettings.contents = {"nulvl":userSettings.contents.nulvl+1, "day": userSettings.contents.day, "hint": userSettings.contents.hint}
                //home.nulvl = home.nulvl-1;
            }
            PopupUtils.open(dialog)
            //playSound.play()
            return true;
        }

        function copy(){
            if(level00.contents.stages[home.nulvl].size === 3){
                for(var x = 0; x< level00.contents.stages[home.nulvl].myArray.length; x++){
                    move.myArray[x] = level00.contents.stages[home.nulvl].myArray[x];
                }
                table.model = move.myArray
            } else{
                for(var x = 0; x< level00.contents.stages[home.nulvl].myArray.length; x++){
                    move.myArray15[x] = level00.contents.stages[home.nulvl].myArray[x];
                }
                table.model = move.myArray15
            }
        }
        function text(){
            for(var x = 0; x< level00.contents.stages[home.nulvl].myArray.length; x++){
                print(move.myArray[x])
            }
        }
        function reArray(){
            if(level00.contents.stages[home.nulvl].size === 3){
            for(var x = 0; x< move.myArray.length; x++){
               move.myArray[x] = level00.contents.stages[home.nulvl].myArray[x];
            }
            table.model = move.myArray;
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
        model:level00.contents.stages[home.nulvl].myArray//grid.myArray
        delegate:Item{
                    id:cellHolder
                    width: table.cellHeight; height: width
                Rectangle {
                    id:cells
                    width: parent.width; height: width
                    property int cellIndex: parseInt(table.index)
                    color:level00.contents.stages[home.nulvl].size === 3 ? level00.contents.stages[home.nulvl].myColors[move.myArray[model.index]]:level00.contents.stages[home.nulvl].myColors[move.myArray15[model.index]];
                    anchors.centerIn: parent
                    Behavior on width { NumberAnimation { duration: 250; easing: UbuntuAnimation.StandardEasing } }
                }

                Icon {
                    id:cellText
                    anchors.centerIn: parent
                    height:units.gu(2)
                    width:height
                    color: "#f0f0f0"
                    opacity:move.toggle
                    Behavior on opacity { NumberAnimation { property: "opacity"; duration: 250; easing: UbuntuAnimation.StandardEasing} }
                    name: level00.contents.stages[home.nulvl].size === 3 ? Logic.iconType(move.myArray,move.correct,modelData) : Logic.iconType2(move.myArray15,move.correct15,model.index);
                }

                    MouseArea{
                        //onReleased: playSound2.play()
                        anchors.fill: parent
                        visible:level00.contents.stages[home.nulvl].size === 3 ? Logic.visButton(move.myArray,model.index) : Logic.visButton2(move.myArray15,model.index)
                            //Logic.visButton(move.myArray,move.myArray15,model.index,level00.contents.stages[home.nulvl].size);//model.index === move.myArray[0] || model.index === move.myArray[2] || model.index === move.myArray[6] || model.index === move.myArray[8] ? false : true;
                        onClicked: {
                            //playSound.play();//move.swap === false ? playSound.play() : playSound2.play()
                            cells.width >= cellHolder.width ? cells.width = cellHolder.width - units.gu(2) : cells.width = cellHolder.width;
                           level00.contents.stages[home.nulvl].size === 3 ? move.swicth(model.index, move.myArray[parseInt(model.index)]) : move.swicth(model.index, move.myArray15[parseInt(model.index)]);
                        }
                    }
                }//end item
    }//end of grid

    SetComponent{
        width:parent.width
        height:units.gu(5)
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
}


