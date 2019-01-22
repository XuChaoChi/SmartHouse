import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import "../component"
XPage {
    id:mainPage;
    title: qsTr("");
    Rectangle{
        id:bgRect;
        width: parent.width;
        height: dpH(640-104);
        color: "#049eff";
        Image {
           anchors.fill:parent;
            id:circle;
            source: "qrc:/imgs/other/circle_big.png";
            Column{
                spacing: dpH(5);
                anchors.verticalCenterOffset: dpH(-50);
                anchors.centerIn: parent;
                XNormalText {
                    id: cityText;
                    color:"white"
                    text: qsTr("City");
                    font.pixelSize: dpX(35);
                }
                Row{
                    spacing: dpW(5);
                    XNormalText {
                        id: dateText;
                        text: qsTr("Date");
                        color: "white";
                        font.pixelSize: dpX(15);
                    }
                    XNormalText {
                        id: typeText;
                        text: qsTr("Weather");
                        color: "white";
                        font.pixelSize: dpX(15);
                    }
                }
            }
        }

    }



    Rectangle{
        id:warnRect;
        anchors.bottom: bgRect.bottom;
        MouseArea{
            id: warnRectMouseArea;
            anchors.fill: parent;
            onClicked: {
                stackViewPush("qrc:/pages/Page_Alarm.qml");
            }
        }
        Rectangle{
            id:lineRect;
            color:Qt.rgba(255,255,255, 0.3);
            height: dpH(1);
            width: parent.width;
            anchors.top: parent.top;
        }
        Column{
            anchors.left:warnImg.right;
            anchors.verticalCenter: parent.verticalCenter;
            spacing: dpH(5);
            XNormalText {
                text: qsTr("Security alarm");
                font.pixelSize: dpX(14);
                color: "white";
            }
            XNormalText{
                id:event_text;
                text: qsTr("17:00 Someone in the living room broke into");
                font.pixelSize: dpX(10);
                color: "white";
            }
        }
        color: warnRectMouseArea.pressed ? Qt.rgba(0,0,0,0.2) :  Qt.rgba(0,0,0,0);
        width: parent.width
        height: dpH(60);

        anchors.horizontalCenter: parent.horizontalCenter;
        Image {
            id:warnImg;
            anchors.leftMargin: dpW(25);
            height: dpH(60); width: dpW(60);
            scale: 0.7;
            opacity: 0.8;
            source: "qrc:/imgs/other/circle_small.png";
            Image {
                height: dpH(60); width: dpW(60);
                scale: 0.6;
                source: "qrc:/imgs/icon/warn.png"
            }
        }

        Image {
            anchors.right: parent.right;
            anchors.verticalCenter: parent.verticalCenter;
            width: dpW(60);
            height: dpH(60);
            opacity: 0.8;
            scale: 0.5;
            source: "qrc:/imgs/other/navigation_next_item.png"
        }

    }

    Grid{
        anchors.bottom:warnRect.top;anchors.bottomMargin: dpH(35);
        anchors.horizontalCenter: parent.horizontalCenter;
        width: dpW(220);height: dpH(50);
        rows:2;columns: 2;
        rowSpacing: dpH(10);
        XNormalText {
            color: "white";
            text: qsTr("Indoor temperature");
            font.pixelSize: dpX(14);
        }
        XNormalText {

            text: qsTr("Indoor humidity");
            font.pixelSize: dpX(14);
            color: "white";
        }
        Rectangle{
            color:Qt.rgba(0,0,0,0);
            width: dpW(110);
            height: dpH(30);

            XNormalText{
                id:tmpText;
                anchors.centerIn: parent;
                text:qsTr("20");
                font.pixelSize: dpX(30);
                color: "white";
            }
            XNormalText{
                anchors.left: tmpText.right;
                anchors.bottom: tmpText.bottom;
                anchors.bottomMargin: dpH(5);
                text:qsTr("℃");
                font.pixelSize: dpX(15);
                color: "white";
            }
        }
        Rectangle{
            color:Qt.rgba(0,0,0,0);
            width: dpW(110);
            height: dpH(30);
            XNormalText{
                id:rh_text;
                anchors.centerIn: parent;
                text:qsTr("20");
                font.pixelSize: dpX(30);
                color: "white";
            }
        }
    }

    footer: TabBar {
        id:tabBar;
        anchors.bottom: mainPage.bottom;
        contentHeight: dpH(104);
        XMainTabBtn {
            height:parent.height;
            imgPath: "qrc:/imgs/btn/main_bottom_btn1.png";
            btnText: qsTr(" Control");
            onClicked: {
                stackViewPush("qrc:/pages/Page_Control.qml");
            }
        }
        XMainTabBtn {
            height:parent.height;
            imgPath:"qrc:/imgs/btn/main_bottom_btn2.png";
            btnText: qsTr("Mode");
            onClicked: {
                stackViewPush("qrc:/pages/Page_Mode.qml");
            }
        }
        XMainTabBtn {
            height:parent.height;
            imgPath: "qrc:/imgs/btn/main_bottom_btn3.png";
            btnText: qsTr("Monitor");
        }
        XMainTabBtn {
            height:parent.height;
            imgPath: "qrc:/imgs/btn/main_bottom_btn4.png";
            btnText: qsTr("Security ");
        }
    }
}
