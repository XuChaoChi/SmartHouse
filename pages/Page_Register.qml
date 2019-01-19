import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
import "../component"
XPage {
    id:regPage;
    title: qsTr("REGISTER");
    property bool userNameStatus: false;
    property int pwMinSize:6

    GridLayout{
        id:gLayout;
        anchors.horizontalCenter: parent.horizontalCenter;
        columns: 3;
        columnSpacing: 0;

        width: dpW(315); height: dpH(340);
        XNormalText {
            Layout.preferredWidth: dpW(80);
            text: qsTr("account");
        }

        TextInput{
            id:user_tInput;
            Layout.preferredWidth: dpW(170);
            validator: RegExpValidator{regExp: /^[\w]{6,20}$/}
        }
        Rectangle{
            Layout.preferredWidth: dpW(65);
            Image {
                anchors.centerIn: parent;
                id:u_img;
                height: dpH(25);
                width: dpW(25);
                source: userNameStatus?"qrc:/imgs/icon/ok.png":"qrc:/imgs/icon/no.png";
            }
        }

        Rectangle{
            width: parent.width;
            Layout.columnSpan: 3;
            Layout.preferredHeight: dpH(1);
            color: "#d8d8d8";
        }
        XNormalText {
            text: qsTr("password");
        }
        TextInput{
            id:pw_tInput;
            echoMode: TextInput.Password;
            validator: RegExpValidator{regExp: /^[\w]{6,20}$/}
            Layout.preferredWidth: dpW(170);
            onTextChanged: {
                    pw_img.source = (text.length < pwMinSize)?"qrc:/img/img/icon/no.png":"qrc:/img/img/icon/ok.png";
            }
        }
        Rectangle{
            Layout.preferredWidth: dpW(65);
            Image {
                anchors.centerIn: parent;
                id:pw_img;
                height: dpH(25);
                width: dpW(25);
                source: "qrc:/imgs/icon/ok.png";
            }
        }
        Rectangle{
            Layout.columnSpan: 3;
            Layout.preferredHeight: dpH(1);
            width: parent.width;
            color: "#d8d8d8";
        }
        XNormalText {
            text: qsTr("repeat password");
        }
        TextInput{
            id:pw2_tInput;
            echoMode: TextInput.Password;
            Layout.preferredWidth: dpW(170);
            validator: RegExpValidator{regExp: /^[\w]{6,20}$/}
            onTextChanged: {
                pw2_img.source = ((text.length < pwMinSize)|| (pw_tInput.text != pw2_tInput.text))  ?"qrc:/img/img/icon/no.png":"qrc:/img/img/icon/ok.png";
            }
        }
        Rectangle{
            Layout.preferredWidth: dpW(65);
            Image {
                anchors.centerIn: parent;
                id:pw2_img;
                height: dpH(25);
                width: dpW(25);
                source: "qrc:/imgs/icon/ok.png";
            }
        }



        Rectangle{
            Layout.columnSpan: 3;
            Layout.preferredHeight: dpH(1);
            width: parent.width;
            color: "#d8d8d8";

        }
        XNormalText {
            text: qsTr("phone");
        }
        TextInput{
            id:phone_tInput;
            validator: RegExpValidator{regExp: /^[0-9]{6,11}$/}
            Layout.preferredWidth: dpW(170);
        }
        Rectangle{
            Layout.preferredWidth: dpW(65);
            Image {
                anchors.centerIn: parent;
                id:phone_img;
                height: dpH(25);
                width: dpW(25);
                source: "qrc:/imgs/icon/ok.png";
            }
        }
        Rectangle{
            Layout.columnSpan: 3;
            Layout.preferredHeight: dpH(1);
            width: parent.width;
            color: "#d8d8d8";
        }

        XNormalText {
            text: qsTr("verification");
        }
        TextInput{
            id:validate_tInput;
            Layout.preferredWidth: dpW(170);
        }
        XNormalText {

            text: qsTr("send");
            color: "#489beb";
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    var dialog = Qt.createComponent("qrc:/component/XPromptBox.qml").createObject(regPage);
                    dialog.msgText = qsTr("send verification clicked");
                }
            }
        }
        Rectangle{
            Layout.columnSpan: 3;
            Layout.preferredHeight: dpH(1);
            width: parent.width;
            color: "#d8d8d8";
        }

        XNormalText {
            Layout.columnSpan: 3;
            text: qsTr("info:password can't be short");
            width: parent.width;
            color: "#d8d8d8";
        }
    }

    XSubmitBtn{
        anchors.bottom: parent.bottom;
        width: parent.width;
        height: dpH(45);
        radius: 0;
        text: qsTr("register");
        onClicked: {
            var dialog = Qt.createComponent("qrc:/component/XPromptBox.qml").createObject(regPage);
            dialog.msgText = qsTr("register");
        }
    }


    Rectangle{
        width: dpW(360);
        height: dpH(640);
        color: "white";
        z:-1;
    }

}
