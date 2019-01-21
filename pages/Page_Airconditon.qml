import QtQuick 2.2
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Dialogs 1.0
import "../component"

XPage {
    title: qsTr("AIRCONDITION");
    property bool bPower: false;
    Rectangle{
        width: dpW(50);
        height: dpH(50);
        color: Qt.rgba(0,0,0,0);
        anchors.top: parent.top;
        anchors.topMargin: dpH(100);
        radius: width/2;
        border.color: Qt.rgba(255,255,255,0.6);
        opacity: 0.8;
        border.width: 1;
        anchors.horizontalCenter: parent.horizontalCenter;
        Image {
            anchors.fill: parent;
            scale: 0.55;
            id: power_img;
            source: bPower ? "qrc:/imgs/btn/power_on.png" : "qrc:/imgs/btn/power_off.png";
        }
        MouseArea{
            anchors.fill: parent;
            onClicked: {
                bPower = bPower == true ? false : true;
                console.log("click"+bPower);
            }
        }
    }
    Rectangle{
        anchors.fill: parent;
        z:-1;
        Image {
            anchors.fill: parent;
            source: "qrc:/imgs/bg/darkblue.jpg"
        }
    }

    Rectangle{
        id:dial_rect;
        anchors.centerIn: parent;
        width: dpW(190);
        height: dpH(190);
        border.width: dpW(10);
        border.color: Qt.rgba(0,0,0,0.1);
        color: Qt.rgba(0,0,0,0);
        radius: width/2;
    Dial {
        id:dial;
        XNormalText {
            anchors.centerIn: parent;
            id: value_text;
            color:"white";
            font.family: "方正兰亭超细黑简体";
            font.bold: true;
            font.pixelSize: dpX(60);
            text: dial.value.toString();
        }
        XNormalText{
            anchors.left: value_text.right;
            anchors.bottom: value_text.bottom;
            anchors.bottomMargin: dpH(10);
            font.pixelSize: dpX(20);
            text: "℃";
            color: "white";
        }
        XNormalText{
            id:mode_text;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: value_text.bottom;
            font.pixelSize: dpX(10);
            text: "mode clod";
            color: "white";
        }

        anchors.centerIn: parent;
        tickmarksVisible:false;
        stepSize: 1;
        maximumValue: 31;
        minimumValue: 16;
        onValueChanged: {
           canvas.requestPaint();
            console.log(value);
        }
        Canvas{
            id:canvas;
            width: dpW(169);
            height: dpH(169);
            anchors.centerIn: parent
            contextType: "2d"
            antialiasing:true

            onPaint: {
                var ctx = getContext("2d");
                ctx.clearRect(0, 0, width, height)
                ctx.lineWidth = dpW(2)
                ctx.strokeStyle = "#0efa88"
                ctx.fillStyle = "transparent"
                ctx.beginPath();
                ctx.arc(width/2,height/2,width/2-2,Math.PI/8*5,Math.PI/8*5+(2/15)*(Math.PI-(1/8)*Math.PI)*(dial.value-16));
                ctx.fill();
                ctx.stroke();

            }
        }
        style: DialStyle {
            labelInset: 0;
            handle :Rectangle{
            }
            background: Rectangle{
                color:Qt.rgba(26,26,26,0.1)
                implicitWidth: dpW(170);
                implicitHeight: dpH(170);
                radius: implicitWidth/2;
                border.color: Qt.rgba(0,0,0,0.3);
                border.width: dpX(2);
                Rectangle{
                    anchors.centerIn: parent;
                    width: dpW(172);
                    height: dpH(172);
                    color: "white";
                    radius: width/2;
                    opacity: 0.08;
                }
            }
        }
    }
    }

    Rectangle{
        id:addRect;
        color: Qt.rgba(0,0,0,0);
        width: dpW(28);
        height: dpH(28);
        anchors.left: parent.left;
        anchors.verticalCenter: dial_rect.verticalCenter;
        anchors.leftMargin: dpW(34);
        Image{
            anchors.fill: parent;
            source:"qrc:/imgs/btn/add.png";
        }
        MouseArea{
            anchors.fill: parent;
            onClicked: {
                dial.value++;
            }
        }
    }

    Rectangle{
        id:subRect;
        color: Qt.rgba(0,0,0,0);
        width: dpW(28);
        height: dpH(28);
        anchors.right: parent.right;
        anchors.rightMargin: dpW(34);
        anchors.verticalCenter: dial_rect.verticalCenter;

        Image{
            anchors.fill: parent;
            source:"qrc:/imgs/btn/sub.png";
        }
        MouseArea{
            anchors.fill: parent;
            onClicked: {
                dial.value--;
            }
        }
    }

    Grid{
        columns: 3;
        rows: 2;
        horizontalItemAlignment: Grid.AlignHCenter;
        rowSpacing: dpH(12);
        columnSpacing: dpW(50);
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: dpH(81);
        Rectangle{
            width: dpW(55);
            height: dpH(55);
            radius: width/2;
            color: Qt.rgba(0,0,0,0);
            border.color: Qt.rgba(255,255,255,0.6);
            Image {
                width: dpW(55);
                height: dpH(55);
                id: mode_img;
                scale: dpX(0.5);
                source: "qrc:/imgs/icon/cold.png";
            }
        }
        Rectangle{
            width: dpW(55);
            height: dpH(55);
            radius: width/2;
            color: Qt.rgba(0,0,0,0);
            border.color: Qt.rgba(255,255,255,0.6);
            Image {
                width: dpW(55);
                height: dpH(55);
                id: wind_img;
                scale: dpX(0.5);
                source: "qrc:/imgs/icon/wind_small.png";
            }
        }
        Rectangle{
            width: dpW(55);
            height: dpH(55);
            radius: width/2;
            color: Qt.rgba(0,0,0,0);
            border.color: Qt.rgba(255,255,255,0.6);
            Image {
                width: dpW(55);
                height: dpH(55);
                id: time_img;
                scale: dpX(0.5);
                source: "qrc:/imgs/icon/time.png";
            }
        }
        XNormalText {
            font.pixelSize: dpX(15);
            color:"white";
            text: qsTr("mode")
        }
        XNormalText {
            font.pixelSize: dpX(15);
            color:"white";
            text: qsTr("speed")
        }
        XNormalText {
            font.pixelSize: dpX(15);
            color:"white";
            text: qsTr("timing")
        }
    }
}
