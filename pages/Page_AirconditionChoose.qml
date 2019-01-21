import QtQuick 2.0
import "../component"
XPage {
    title: qsTr("AIRCONDITIONS");
    Column{
        width: parent.width;
        height: parent.height;
        XTopRect{
            XTopRect{
                id:topRect;
                imgPath: "qrc:/imgs/icon/aircondition_small.png";
                imgScale: 0.35;
                imgOffset: 25;
                bgColor: "#049eff";
            }
        }
        XControlListView{
            id:listView;
            iconScale:0.7;
            width: parent.width;
            height: parent.height - topRect.height;
            Component.onCompleted: {
                addDevice(1, "Living Room", 1, "qrc:/imgs/icon/aircondition_small.png");
                addDevice(2, "Bedroom", 0, "qrc:/imgs/icon/aircondition_small.png");
            }
        }
    }
}
