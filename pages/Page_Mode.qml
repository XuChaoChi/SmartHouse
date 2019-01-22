import QtQuick 2.0
import QtGraphicalEffects 1.12
import "../component"
XPage {
    id: modePage;
    title: qsTr("MODE");
    color: "#262c38";
    showToolBtn: true;
    Connections{
        target: mainToolBar;
        onSig_ToolBtnClicked:
        {
            showMsgBox("edit..");
        }
    }

    GridView{
        id:gridView;
        width: parent.width;
        height: parent.height - dpH(40);
        cellWidth: dpW(120); cellHeight: dpH(120);
        focus: true;
        model:listModel;

        delegate: Rectangle{
            Column {
                 height: dpH(120);
                 width: dpW(120);
                  Image { id:img; source: portrait; anchors.horizontalCenter: parent.horizontalCenter; width:dpW(80); height: dpH(80);}
                  XNormalText { text: name; anchors.horizontalCenter: parent.horizontalCenter; font.pixelSize: dpX(12); }
                }
             color:Qt.rgba(0,0,0,0);
             border.color: Qt.rgba(0,0,0,0.05);
             border.width: dpX(1);
             height: dpH(120);
             width: dpW(120);
             MouseArea {
                 anchors.fill: parent;
                 onClicked:{
                     if(index == (gridView.count-1)){
                         showMsgBox("add...");
                     }
                     else{
                         gridView.currentIndex = index;
                         console.log(index);
                     }
                 }
             }
        }

        highlight: Rectangle{
            height: dpH(120);
            width: dpW(120);
            color:Qt.rgba(0,0,0,0);
            Image {
                width: dpW(25);
                height: dpH(25);
                anchors.right: parent.right; anchors.top:parent.top;
                anchors.rightMargin: dpW(15); anchors.topMargin: dpH(15);
                source: "qrc:/imgs/icon/mode/choose.png"
            }
        }

        Rectangle{
            id:back_rect;
            color:"white";
            anchors.fill: parent;
            z:-1;
        }

    }

    ListModel {
          id:listModel;
          ListElement {
              name: qsTr("sun");
              portrait: "qrc:/imgs/icon/mode/sun.png";
          }
          ListElement {
              name: qsTr("bag");
              portrait: "qrc:/imgs/icon/mode/bag.png";
          }
          ListElement {
              name: qsTr("music");
              portrait: "qrc:/imgs/icon/mode/dvd.png";
          }
          ListElement {
              name: qsTr("moon");
              portrait: "qrc:/imgs/icon/mode/moon.png";
          }
          ListElement {
              name: qsTr("add");
              portrait: "qrc:/imgs/icon/mode/add.png";
          }
    }

}
