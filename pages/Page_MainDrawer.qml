import QtQuick 2.5
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import "../component"
Drawer {
    id: drawer
    width: window.width * 0.75
    height: window.height
    LinearGradient {
        Column {
            anchors.fill: parent;
            Rectangle{
                width: parent.width;
                height: dpH(70);
                color: Qt.rgba(0,0,0,0);
                MouseArea{
                    anchors.fill: parent;
                    onClicked: {
                        stackViewPush("qrc:/pages/Page_UserInfo.qml");
                        drawer.close();
                    }
                }
                RowLayout {
                    width: parent.width;
                    height: dpH(70);
                    Rectangle{
                        Image {
                            anchors.fill: parent;
                            source: "qrc:/imgs/icon/user2.png"
                        }
                        Layout.preferredWidth: dpW(40);
                        Layout.preferredHeight: dpH(40);
                        radius: width / 2;
                        color: Qt.rgba(0,0,0,0);
                    }
                    XNormalText{
                        color: "white";
                        text: "XuChaoChi@gmail.com";
                        Layout.alignment: parent.verticalCenter | Qt.AlignLeft;

                    }
                    Image {
                        Layout.alignment: parent.verticalCenter | Qt.AlignRight;
                        Layout.rightMargin: dpW(10);
                        Layout.preferredWidth: dpW(25);
                        Layout.preferredHeight: dpH(25);
                        source: "qrc:/imgs/other/navigation_next_item.png"
                    }


                }
            }

            Rectangle{
                id: lineRect;
                width: parent.width;
                height: dpH(1);
                color: Qt.rgba(255,255,255,0.3);
            }
            XMainDrawerItem{
                iconImg: "qrc:/imgs/icon/main/master.png"; strKey: qsTr("Master"); strValue: "Master1";
            }
            XMainDrawerItem{
                iconImg: "qrc:/imgs/icon/main/music.png"; strKey: qsTr("BG Music"); strValue: qsTr("How To Love");
            }
            XMainDrawerItem{
                iconImg: "qrc:/imgs/icon/main/alarm.png"; strKey: qsTr("Alarm linkage");
            }
            XMainDrawerItem{
                iconImg: "qrc:/imgs/icon/main/time.png"; strKey: qsTr("Timing arming");
            }
            XMainDrawerItem{
                iconImg: "qrc:/imgs/icon/main/pos.png"; strKey: qsTr("Region");
            }
            XMainDrawerItem{
                iconImg: "qrc:/imgs/icon/main/sys.png"; strKey: qsTr("System");
            }
        }

        anchors.fill: parent;
        gradient: Gradient {
            GradientStop{ position: 0.0; color: "#05265b";}
            GradientStop{ position: 0.5; color: "#0b4889";}
            GradientStop{ position: 1.0; color: "#47729c";}
        }
        start: Qt.point(0, 0);
        end: Qt.point(parent.width, parent.height);
    }

}
