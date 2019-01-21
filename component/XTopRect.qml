import QtQuick 2.0

Rectangle{
    property string bgColor: "";
    property string imgPath: "";
    property int    imgOffset: 0;
    property double imgScale: 1;
    id:top;
    z:5;
    width: parent.width;
    height: dpH(253);
    color: bgColor;
    Image {
        width: dpW(190);
        height: dpH(190);
        anchors.verticalCenter: parent.verticalCenter;
        anchors.horizontalCenter: parent.horizontalCenter;
        id: light;
        Image {
            width: parent.width;
            height: parent.height;
            anchors.verticalCenterOffset: dpH(imgOffset);
            scale: imgScale;
            anchors.centerIn: parent;
            source: imgPath;
        }
        source: "qrc:/imgs/other/circle_top.png";
    }
}
