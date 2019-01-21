import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import "../component"
XPage{
    title: qsTr("CONTROL");
    GridView{
        cellWidth: dpW(109);
        cellHeight: dpH(121);
        anchors.horizontalCenter: parent.horizontalCenter;
        width: dpW(327)
        height: parent.height;
        model:controlModel;
        delegate: Column {
                XControlBtn {
                      imgPath: portrait;
                      onClicked: {
                        stackViewPush(pages);
                      }
                 }
            }
    }
    ListModel{
        id:controlModel;
        ListElement{
            portrait: "qrc:/imgs/btn/Control_button_01.png";
            pages: "qrc:/pages/Page_AirconditionChoose.qml";
        }
        ListElement{
            portrait: "qrc:/imgs/btn/Control_button_02.png";
            pages: "qrc:/pages/Page_LightChoose.qml";
        }
        ListElement{
            portrait: "qrc:/imgs/btn/Control_button_03.png";
            pages: "11";
        }
        ListElement{
            portrait: "qrc:/imgs/btn/Control_button_04.png";
            pages: "11";
        }
        ListElement{
            portrait: "qrc:/imgs/btn/Control_button_05.png";
            pages: "11";
        }
        ListElement{
            portrait: "qrc:/imgs/btn/Control_button_06.png";
            pages: "11";
        }
        ListElement{
            portrait: "qrc:/imgs/btn/Control_button_07.png";
            pages: "11";
        }
        ListElement{
            portrait: "qrc:/imgs/btn/Control_button_08.png";
            pages: "11";
        }
        ListElement{
            portrait: "qrc:/imgs/btn/Control_button_09.png";
            pages: "11";
        }
    }
    Image {
        anchors.fill: parent;
        id: bgImg;
        z: -1;
        source: "qrc:/imgs/bg/darkblue.jpg";
    }
}
