import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Button{
    property url imgPath: "";
    property string btnText: "";
    width: dpW(109);
    height: dpH(121);
    Image{
        anchors.fill: parent;
        source: imgPath;
    }
    style: ButtonStyle{
        background: Rectangle{
            color: Qt.rgba(0,0,0,0);
            border.color: Qt.rgba(255,255,255,0.1);
            border.width: dpX(1);
            radius: dpX(2);
        }
    }
}
