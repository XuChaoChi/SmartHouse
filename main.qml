import QtQuick 2.9
import QtQuick.Controls 2.2
import "pages"
import "component"
ApplicationWindow {
    id: window
    visible: true
    title: qsTr("Smart House")
    width: 360
    height: 640
    property real multiplierH: (window.height/640)*1000;
    property real multiplierW: (window.width/360)*1000;
    function dpH(numbers) {
           return numbers*multiplierH/1000;
    }
    function dpW(numbers) {
       return numbers*multiplierW/1000;
    }
    function dpX(numbers){
        return (dpW(numbers)+dpH(numbers))/2;
    }

    header: XToolBar {
        id:mainToolBar;

    }

    signal sig_StackViewPush(string strPath);
    signal sig_StackViewPop(int nIndex);
    function stackViewPush(strPath){
        emit: sig_StackViewPush(strPath);
    }

    function stackViewPop(nIndex){
        emit: onSig_StackViewPop(nIndex);
    }


    onSig_StackViewPush: {
        console.log("push page: "+strPath)
        stackView.push(strPath);
        var item  = stackView.currentItem;
    }
    onSig_StackViewPop: {
        if(stackView.depth > 1){
            stackView.pop(nIndex);
        }else if(index == -1)
        {
            stackView.pop();

        }
        else if(nIndex == 0)
        {
            stackView.clear();
            return;
        }
        var item  = stackView.currentItem;
    }

    StackView {
        id: stackView
        initialItem: "qrc:/pages/Page_Login.qml"
        anchors.fill: parent
    }

}
