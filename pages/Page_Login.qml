import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
import "../component"
XPage {
    id:loginPage;
    title: qsTr("");
    Rectangle{
        id:logo_rect;
        color: Qt.rgba(0,0,0,0);
        width: dpW(76);
        height: dpH(76);
        anchors.top:parent.top;
        anchors.topMargin: dpH(75);
        anchors.horizontalCenter: parent.horizontalCenter;
        Image {
            id: logo_img;
            anchors.fill: parent;
            source: "qrc:/imgs/icon/logo.png";
        }

    }
    Rectangle{
        id:tfGroup;
        anchors.top:logo_rect.bottom;
        anchors.topMargin: dpH(48);
        anchors.horizontalCenter: parent.horizontalCenter;
        width: dpW(301);
        height: dpH(100);
        radius: dpX(5);
        color: Qt.rgba(255,255,255,0.2);
        GridLayout{
            columns: 2;
            rows:    3;
            rowSpacing: 0;
            columnSpacing: 0;

            Image {
                id: un_img;
                scale: 0.7;
                Layout.preferredWidth:dpW(50);
                Layout.preferredHeight:dpH(50);
                source: "qrc:/imgs/icon/account.png"
            }


            TextField{
                id :un_TF;
                Layout.preferredWidth:dpW(230);
                Layout.preferredHeight:dpH(50);
                font.pixelSize: dpX(15);
                textColor: "white";
                style:TextFieldStyle{
                background: Rectangle {
                            opacity: 0;
                        }
                }
            }

            Rectangle{
                id:lineRect;
                width: dpW(301)
                height: dpH(1);
                color:"white";
                opacity: 0.3;
                Layout.columnSpan: 2;
            }

            Image {
                id: pwImg;
                scale: 0.7;
                Layout.preferredWidth:dpW(50);
                Layout.preferredHeight:dpH(50);
                source: "qrc:/imgs/icon/password.png"
            }


            TextField{
                id :pwTF;
                Layout.preferredWidth:dpW(230);
                Layout.preferredHeight:dpH(50);
                width: parent.width;

                validator: RegExpValidator{regExp: /^[\w]{6,20}$/}
                font.pixelSize: dpX(15);
                echoMode: 2;
                textColor: "white";
                style:TextFieldStyle{
                background: Rectangle {
                            opacity: 0;
                        }
                }
            }
        }
    }


    XSubmitBtn{
        id:submitBtn;
        text: qsTr("LOGIN");
        anchors.top: tfGroup.bottom;
        anchors.topMargin: dpH(25);
        anchors.horizontalCenter: parent.horizontalCenter;
        width: dpW(301);
        height: dpH(40);
        onClicked: {
            emit: sig_StackViewPush("qrc:/pages/Page_Main.qml");
            console.log("login clicked");
        }
    }

    RowLayout{
        width: dpW(301);
        height: dpH(40);
        anchors.top: submitBtn.bottom;
        anchors.topMargin: dpH(10);
        anchors.left: tfGroup.left;

        XNormalText {
            id: forgetText;
            color: "white";
            text: qsTr("forget");
        }

        XNormalText {
            id: registerText;
            Layout.alignment: Qt.AlignRight;
            color: "white";
            text: qsTr("register");
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    emit: sig_StackViewPush("qrc:/pages/Page_Register.qml");
                }
            }
        }
    }


    Rectangle{
        id:bgRect;
        z:-1;
        anchors.fill: parent;
        Image {
            id: bg_img;
            anchors.fill: parent;
            source: "qrc:/imgs/bg/login.jpg";
        }
    }
}
