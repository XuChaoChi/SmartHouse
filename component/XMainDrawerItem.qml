import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
ItemDelegate {
    width: parent.width;
    height: dpH(40);
    property url iconImg: "";
    property string strKey: "";
    property string strValue: "";
    RowLayout{
        width: parent.width;
        height: parent.height;
        Image {
            Layout.leftMargin: dpW(10);
            Layout.preferredWidth: dpW(25); Layout.preferredHeight: dpH(25);
            source: iconImg;
        }
        XNormalText {
            Layout.alignment: Qt.AlignLeft;
            Layout.leftMargin: dpW(10);
            Layout.preferredWidth: dpW(100);
            text: strKey;
            color: "white";

        }
        XNormalText {
            Layout.rightMargin: dpW(10);
            Layout.alignment: Qt.AlignLeft;
            Layout.preferredWidth: dpW(100);
            text: strValue;
            color: "#00ffd4";
        }
    }

    background : Rectangle{

        color: parent.pressed ? Qt.rgba(0,0,0,0.2) : Qt.rgba(0,0,0,0);
    }
}
