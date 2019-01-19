import QtQuick 2.0

Rectangle{
    property string msgText: "";
    property int waitTime: 0;
    property string msgColor: "black";
    id:msg_rect;
    radius: dpX(20);
    z: 5;
    width: dpW(200);
    height: dpH(30);
    color:msgColor;
    opacity:0;
    anchors.centerIn: parent;
    XNormalText{
        anchors.centerIn: parent;
        text:msgText;
        color: "white";
        font.pixelSize: dpX(15);
    }
    Component.onCompleted: {
        animation.start();
    }
    SequentialAnimation{
        id:animation;
        onStopped: {
            msg_rect.destroy;
        }
        NumberAnimation {
            target: msg_rect;
            property: "opacity";
            duration: waitTime;
            to:0;
            easing.type: Easing.InCubic;
        }
        NumberAnimation {
            target: msg_rect;
            property: "opacity";
            duration: 2000;
            to:50;
            easing.type: Easing.InOutQuad;
        }
        NumberAnimation {
            target: msg_rect;
            property: "opacity";
            duration: 1000;
            to:0;
            easing.type: Easing.InOutQuad;
        }

    }

}
