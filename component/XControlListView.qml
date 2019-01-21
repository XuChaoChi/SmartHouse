import QtQuick 2.0
ListView{
    property double iconScale: 1;
    function addDevice(dID, dText, dState, dImgPath)
    {
        listModel.append({
             deviceText:    dText,
             deviceState:   dState,
             deviceID:      dID,
             deviceImg:     dImgPath
         })
    }

    model: ListModel{
        id: listModel;
    }
    delegate: Component{
        Item {
            width: parent.width
            height: dpH(65);

            MouseArea{
                   anchors.fill: parent;
                   onClicked: {
                        stackViewPush("qrc:/pages/Page_Airconditon.qml");
                   }
            }
            XNormalText{
                visible: false;
                text: deviceID;
            }
            XNormalText {
                anchors.centerIn: parent.Center;
                anchors.left: parent.left;
                anchors.leftMargin: dpW(100);
                verticalAlignment: Text.AlignVCenter;
                width: dpW(50);
                height: parent.height;
                font.pixelSize: dpX(15);
                text: deviceText;
            }
            XSwitchBtn{
                id: switchBtn;
                checked: deviceState;
                anchors.right: parent.right;
                anchors.rightMargin: dpW(20);
                anchors.verticalCenter: parent.verticalCenter;
            }
            Rectangle{
                id:deviceImgRect;
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: parent.left;
                anchors.leftMargin: dpW(20);
                width: dpW(50);
                height: dpH(50);
                radius: 100;
                Behavior on color {ColorAnimation {}}
                color: switchBtn.checked ? "#4cd964":"#c8cacc";
                Image {
                    anchors.fill: parent;
                    source: deviceImg;
                    scale: iconScale;
                }
            }
            Rectangle{
                id:line;
                color: "#e6e6e6";
                width: parent.width - deviceImgRect.x - deviceImgRect.width;
                height: dpH(1);
                anchors.bottom: parent.bottom;
                anchors.right: parent.right;
            }
        }
    }
}

