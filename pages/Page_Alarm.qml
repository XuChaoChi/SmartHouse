import QtQuick 2.0
import "../component"
XPage{
    title: qsTr("ALARM");
    function addWarnInfo(warnText, iconColor, iconPath, timeText)
    {
        listModel.append({
                             warnText:      warnText,
                             iconColor:     iconColor,
                             iconPath:      iconPath,
                             timeText:      timeText
                         })
    }
    Component.onCompleted: {
        addWarnInfo("fire", "red", "qrc:/imgs/icon/warn/fire.png", "today");
        addWarnInfo("smoke", "lightblue", "qrc:/imgs/icon/warn/smoke.png", "today");
        addWarnInfo("man", "pink", "qrc:/imgs/icon/warn/man.png", "today");
        addWarnInfo("door", "black", "qrc:/imgs/icon/warn/door.png", "today");
    }
    ListView{
        anchors.fill: parent;
        model: ListModel{
            id: listModel;
        }
        delegate: Item{
            height: dpH(65);
            width: parent.width;
            XNormalText {
                anchors.left: iconRect.right;
                anchors.leftMargin: dpW(20);
                verticalAlignment: Text.AlignVCenter;
                width: dpW(50);
                height: parent.height;
                font.pixelSize: dpX(18);
                text: warnText;
            }
            Rectangle{
                id: iconRect;
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: parent.left;
                anchors.leftMargin: dpW(20);
                width: dpW(50);
                height: dpH(50);
                radius: width / 2;
                color: iconColor;
                Image {
                    scale: 0.7;
                    anchors.fill: parent;
                    source: iconPath;
                }
            }
            XNormalText {
                text: timeText;
                anchors.right: parent.right;
                anchors.rightMargin: dpW(10);
                anchors.verticalCenter: parent.verticalCenter;
                color: "#d6d6d6";
                font.pixelSize: dpX(14);
            }
            Rectangle{
                id:line;
                color: "#e6e6e6";
                width: parent.width-iconRect.x-iconRect.width;
                height: dpH(1);
                anchors.bottom: parent.bottom;
                anchors.right: parent.right;
            }
        }
    }
}

