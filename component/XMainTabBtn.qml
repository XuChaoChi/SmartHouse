import QtQuick 2.0
import QtQuick.Controls 2.0
TabButton {
    property url imgPath: "";
    property string btnText: "";
    background: Rectangle{
        id:tabBtnBg;
        Image{
            anchors.fill: parent;
            source: imgPath;
        }
        XNormalText{
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: dpH(15);
            anchors.horizontalCenter: parent.horizontalCenter;
            text: btnText;
        }
        anchors.fill: parent;
        color: parent.pressed? "#09c4e8": "white";

    }
}
