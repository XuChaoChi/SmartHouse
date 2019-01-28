import QtQuick 2.0
import "../component"
XPage {
    title: qsTr("USER INFO");
    color: "black";
    Column{
        width: parent.width;
        height: parent.height;
        Image {
            id: topImg;
            z: 1;
            width: parent.width;
            height: dpH(253);
            source: "qrc:/imgs/bg/userinfo.png"
            Rectangle {
                id: outCircleRect;
                color: Qt.rgba(0,0,0,0);
                border.color: Qt.rgba(255,255,255,0.2);
                border.width: dpX(2);
                width: dpW(75);
                height: dpH(75);
                radius: width / 2;
                anchors.verticalCenter: parent.verticalCenter;
                anchors.verticalCenterOffset: dpH(-30);
                anchors.horizontalCenter: parent.horizontalCenter;
                Rectangle{
                    id: inCircleRect;
                    anchors.verticalCenter: parent.verticalCenter;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    width: dpW(54);
                    height: dpH((54));
                    radius: width / 2;
                    color: Qt.rgba(0,0,0,0);
                    Image {
                        id: userImg;
                        anchors.fill: parent;
                        source: "qrc:/imgs/icon/user2.png";
                    }
                }
            }
            XNormalText{
                text: qsTr("xuchaochi@gmail.com");
                color: "white";
                font.pixelSize: dpX(18);
                anchors.verticalCenter: parent.verticalCenter;
                anchors.verticalCenterOffset: dpH(50);
                anchors.horizontalCenter: parent.horizontalCenter;
            }
        }
        XConfigItemDelegate{
            strKey: qsTr("Nickname"); strValue: qsTr("XuChaoChi");
        }
        XConfigItemDelegate{
            strKey: qsTr("Account"); strValue: qsTr("Chi");
        }
        XConfigItemDelegate{
            strKey: qsTr("Sex"); strValue: qsTr("Man");
        }
        Rectangle{
            width: parent.width;
            height: dpH(13);
            color : "#00000000";
        }
        XConfigItemDelegate{
            showTopLine: true;
            strKey: qsTr("Abort");
        }


    }
}
