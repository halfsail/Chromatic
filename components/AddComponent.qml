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
        onDismissAreaChanged:
        {
            print("dismiss")
            if(home.nulvl < userSettings.contents.nulvl){
                //do nothing
            }else if(userSettings.contents.nulvl+1 >= level00.contents.stages.length){
                print("over here")
                userSettings.contents.nulvl = level00.contents.stages.length-1
            } else {
                userSettings.contents = {"nulvl":userSettings.contents.nulvl+1, "day": userSettings.contents.day, "hint": userSettings.contents.hint}
            }
        }

        Item{
            id:wrapper
            height:units.gu(15)
            width:parent.width
            property var congrats: ["Brilliant","Excellent","Magnificent","Splendid","spectacular","Wonderful"];
        }
        Column{
            height:units.gu(20)
            width:parent.width
            spacing:units.gu(3)
            anchors{
                margins:units.gu(2)
                fill: parent
            }
            Label{
                text:home.nulvl+1 === level00.contents.stages.length ? text="Thank You For Playing" : text=text= wrapper.congrats[Logic.congrats(4)];
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
                        print("maybe")
                        /*if(userSettings.contents.nulvl+1 >= level00.contents.stages.length){
                            print("over here")
                            userSettings.contents.nulvl = level00.contents.stages.length-1
                        } else {
                            userSettings.contents = {"nulvl":userSettings.contents.nulvl+1, "day": userSettings.contents.day, "hint": userSettings.contents.hint}
                            print("this one")
                            if(home.nulvl+1 >= level00.contents.stages.length){
                                home.nulvl = home.nulvl+1
                                print("maybe this one")
                            } else {
                                home.nulvl=userSettings.contents.nulvl
                                print("i'm here")
                            }

                        }*/
                        if(home.nulvl+1 >= level00.contents.stages.length){
                            home.nulvl = home.nulvl
                            print("maybe this one")
                        } else if(home.nulvl < userSettings.contents.nulvl){
                            home.nulvl = home.nulvl+1
                        }else {
                            home.nulvl=userSettings.contents.nulvl
                            print("i'm here")
                        }
                        //userSettings.contents.nulvl === home.nulvl?home.nulvl=home.nulvl: home.nulvl=home.nulvl+1;
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

