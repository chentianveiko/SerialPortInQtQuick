import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

Window {
    visible: true;
    title: qsTr("Serial Port Tool");

    width: 800;
    height: 600;

    color: "#FFFFFF";

    // 端口选择
    RowLayout{
        spacing: 5;
        anchors.left: parent.left;
        anchors.leftMargin: 5;
        anchors.top: parent.top;
        anchors.topMargin: 5;
        height: 28;
        width: parent.width;
        Layout.alignment:Qt.AlignVCenter;


        Label{
            id: labelPort;
            text: qsTr("Port");

            height: 28;

            anchors.left: parent.left;
            anchors.leftMargin: 5;
            anchors.verticalCenter: parent.verticalCenter;
        }
        ComboBox{
            id:comboboxPort;
            model: ["COM1","COM2","COM3"];

            width: 120;
            anchors.left: labelPort.right;
            anchors.verticalCenter: labelPort.verticalCenter;
            anchors.leftMargin: 5;

        }
    }




}

