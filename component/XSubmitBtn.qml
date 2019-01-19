import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Button {
    property int radius: dpX(3);
    width: parent.width;
    height: parent.height;
    id: submitBtn;


    style: ButtonStyle{
        background: Rectangle{
            id:rect_bg;
            color: control.hovered ?"#049eff":Qt.darker("#049eff", 1.1);
            width: parent.width;
            height: parent.height;
            radius: control.radius
            border.color: "#1eb9f2";
            border.width: control.activeFocus ? dpX(2) : dpX(1);
        }
        label: Text {
            renderType: Text.NativeRendering
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "黑体"
            color: "white";
            font.pixelSize: dpX(15);
            text: control.text;
        }
    }

}
