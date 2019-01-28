import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
ItemDelegate {
    width: parent.width;
    height: dpH(50);
    property string strKey: "";
    property string strValue: "";
    property bool showTopLine: false;
    Column{
        width: parent.width;
        height: parent.height;
        Rectangle{
            visible: showTopLine;
            width: parent.width;
            height: dpH(1);
            color: "#aacdcdcd";
        }
        RowLayout{
            width: parent.width;
            height: parent.height;
            XNormalText {
                Layout.alignment: Qt.AlignLeft;
                Layout.leftMargin: dpW(20);
                Layout.preferredWidth: dpW(100);
                text: strKey;
                color: "black";
                font.family: "Verdana";
                font.pixelSize: dpX(16);
            }
            XNormalText {
                Layout.alignment: Qt.AlignRight;
                text: strValue;
                font.family: "Verdana";
                font.pixelSize: dpX(14);
            }
            Image {
                Layout.alignment: parent.verticalCenter | Qt.AlignRight;
                Layout.rightMargin: dpW(10);
                Layout.preferredWidth: dpW(25);
                Layout.preferredHeight: dpH(25);
                source: "qrc:/imgs/other/next.png"
            }
        }
        Rectangle{
            width: parent.width;
            height: dpH(1);
            color: "#aacdcdcd";
        }
    }
    background : Rectangle{
        color: parent.pressed ? "#aaa5c2fd" : Qt.rgba(0,0,0,0);
    }

}
