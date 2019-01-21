import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1

Switch {
    style:
    SwitchStyle {
        groove: Rectangle {
            implicitHeight: dpH(30);
            implicitWidth: dpW(60);
            radius: dpX(20);
            color:control.checked ? "#4cd964":"white";
            border.color:control.checked ? "#4cd964":"#e5e5e5";
            Behavior on color {ColorAnimation {}}
            Behavior on border.color {ColorAnimation {}}
        }
        handle:
            Rectangle {
            width: dpW(30);
            height: dpH(30);
            color: "white";
            border.color: "#e5e5e5";
            radius: dpX(30)
        }
    }
}
