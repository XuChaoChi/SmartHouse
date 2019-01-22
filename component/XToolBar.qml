import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
ToolBar {
    visible: titleText.text !== "";
    height: dpH(40);
    signal sig_ToolBtnClicked(string strTitle);
    Rectangle {
        width: dpW(40);
        height: dpH(40);
        Image{
            id: preImg;
            anchors.fill: parent;
            visible: stackView.depth > 1;
            source: "qrc:/imgs/other/navigation_previous_item.png";
        }
        color: preMouseArea.pressed ? Qt.rgba(255,255,255,0.2) : Qt.rgba(0,0,0,0);
        MouseArea{
            id: preMouseArea;
            anchors.fill: parent;
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                }
            }
        }
    }

    Rectangle {
        width: dpW(40);
        height: dpH(40);
        visible: stackView.currentItem.showToolBtn;
        anchors.right: parent.right;
        Image{
            anchors.fill: parent;
            scale: 0.5;
            source: "qrc:/imgs/btn/choose.png";
        }
        color: toolBtnMouseArea.pressed ? Qt.rgba(255,255,255,0.2) : Qt.rgba(0,0,0,0);
        MouseArea{
            id: toolBtnMouseArea
            anchors.fill: parent;
            onClicked: {
                emit: sig_ToolBtnClicked(stackView.currentItem.title);
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
