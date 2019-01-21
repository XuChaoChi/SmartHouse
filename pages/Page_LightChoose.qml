import QtQuick 2.0
import "../component"
XPage {
    title: qsTr("LIGHTS");
    Column{
        width: parent.width;
        height: parent.height;
        XTopRect{
            id:topRect;
            imgPath: "qrc:/imgs/icon/light_big.png";
            imgScale: 0.5;
            imgOffset: 25;
            bgColor: "#049eff";
        }
        XControlListView{
            id:listView;
            width: parent.width;
            height: parent.height - topRect.height;
            Component.onCompleted: {
                addDevice(1, "Kitchen", 1, "qrc:/imgs/icon/light_small.png");
                addDevice(2, "Bedroom", 0, "qrc:/imgs/icon/light_small.png");
            }
        }
    }
}
