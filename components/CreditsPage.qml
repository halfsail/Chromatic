import QtQuick 2.4
import Ubuntu.Components 1.2

Page {
    title:"Credits"
    visible:false

    Column{
        anchors{
            horizontalCenter: parent.horizontalCenter
            top:parent.top
            topMargin:units.gu(5)
        }

        width:parent.width
        spacing:units.gu(10)
        Item{
            width:parent.width
            height:units.gu(5)
            Column{
                height:parent.height
                spacing:units.gu(1)
                anchors.horizontalCenter: parent.horizontalCenter
                Label{
                    text:"Creator"
                }
                Label{
                    text:"Kevin Feyder"
                    fontSize: "x-large"
                    font.weight: Font.Light
                    font.letterSpacing: units.gu(0.5)
                }
            }
        }
        Item{
            width:parent.width
            height:units.gu(5)
            Column{
                height:parent.height
                spacing:units.gu(1)
                anchors.horizontalCenter: parent.horizontalCenter
                Label{
                    text:"Coding Hero"
                }
                Label{
                    text:"Paul Weaver"
                    fontSize: "x-large"
                    font.weight: Font.Light
                    font.letterSpacing: units.gu(0.5)
                }
            }
        }
    }
}
