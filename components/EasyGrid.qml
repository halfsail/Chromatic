import QtQuick 2.0
import Ubuntu.Components 1.1
import Ubuntu.Components.Popups 1.0
import "../components/backend.js" as Logic
import U1db 1.0 as U1db
import "../components"

Item{
    id:easyLvl
    visible: false
   /* Column {
        spacing: units.gu(7)
        anchors {
            margins: units.gu(2)
            fill: parent
        }
        HeadComponent{
            height:units.gu(5)
            width:parent.width
        }*/


        GridComponent{
            width:parent.width
            height:width
        }

    //}

}
