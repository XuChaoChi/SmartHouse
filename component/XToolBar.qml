import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
ToolBar {

    visible: titleText.text !== "";
    height: dpH(40);
    Rectangle {
        width: dpW(40);
        height: dpH(40);
        Image{
            id: preImg;
            anchors.fill: parent;
            visible: stackView.depth > 1;
            source: "qrc:/imgs/other/navigation_previous_item.png";
        }
        color: mouseArea.pressed ? Qt.rgba(255,255,255,0.2) : Qt.rgba(0,0,0,0);
        MouseArea{
            id: mouseArea;
            anchors.fill: parent;
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                }
            }
        }

    }

    XNormalText {
        id: titleText;
        text: stackView.currentItem.title;
        anchors.centerIn: parent;
        font.pixelSize: dpX(18);
        color: "white";
    }

    background: Rectangle{
        id:bgRect;
        color: stackView.currentItem.color;
    }
}
