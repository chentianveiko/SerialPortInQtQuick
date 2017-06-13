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

    ColumnLayout{
        height: parent.height;
        width: 200;

        Rectangle{
            anchors.fill: parent;
            height: 28;
            color: "#339966";

            // 端口选择
            RowLayout{
                id: layoutPort;
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

                    anchors.left: parent.left;
                    anchors.leftMargin: 5;
                }
                ComboBox{
                    id:comboboxPort;
                    model: ["COM1","COM2","COM3"];

                    width: 120;
                    anchors.right: parent.right;
                    anchors.rightMargin: 10;
                }
            }

            // 波特率
            RowLayout{
                id: layoutBaud;
                spacing: 5;
                anchors.left: parent.left;
                anchors.leftMargin: 5;
                anchors.top: layoutPort.bottom;
                anchors.topMargin: 5;
                height: 28;
                width: parent.width;
                Layout.alignment:Qt.AlignVCenter;

                Label{
                    id: labelBaud;
                    text: qsTr("BaudRate");

                    anchors.left: parent.left;
                    anchors.leftMargin: 5;
                }
                ComboBox{
                    id:comboboxBaud;
                    model: ["9600","19200","115200"];

                    width: 120;
                    anchors.right: parent.right;
                    anchors.rightMargin: 10;
                }
            }

            // 数据位
            RowLayout{
                id: layoutDataBit;
                spacing: 5;
                anchors.left: parent.left;
                anchors.leftMargin: 5;
                anchors.top: layoutBaud.bottom;
                anchors.topMargin: 5;
                height: 28;
                width: parent.width;
                Layout.alignment:Qt.AlignVCenter;

                Label{
                    id: labelDataBit;
                    text: qsTr("DateBit");

                    anchors.left: parent.left;
                    anchors.leftMargin: 5;
                }
                ComboBox{
                    id:comboboxDataBit;
                    model: ["5","6","7","8","9"];

                    width: 120;
                    anchors.right: parent.right;
                    anchors.rightMargin: 10;
                }
            }

            // 校验位
            RowLayout{
                id: layoutParityBit;
                spacing: 5;
                anchors.left: parent.left;
                anchors.leftMargin: 5;
                anchors.top: layoutDataBit.bottom;
                anchors.topMargin: 5;
                height: 28;
                width: parent.width;
                Layout.alignment:Qt.AlignVCenter;

                Label{
                    id: labelParityBit;
                    text: qsTr("ParityBit");

                    anchors.left: parent.left;
                    anchors.leftMargin: 5;
                }
                ComboBox{
                    id:comboboxParityBit;
                    model: ["None","Even","Odd","Mark","Space"];

                    width: 120;
                    anchors.right: parent.right;
                    anchors.rightMargin: 10;
                }
            }

            // 停止位
            RowLayout{
                id: layoutStopBit;
                spacing: 5;
                anchors.left: parent.left;
                anchors.leftMargin: 5;
                anchors.top: layoutParityBit.bottom;
                anchors.topMargin: 5;
                height: 28;
                width: parent.width;
                Layout.alignment:Qt.AlignVCenter;

                Label{
                    id: labelStopBit;
                    text: qsTr("StopBit");

                    anchors.left: parent.left;
                    anchors.leftMargin: 5;
                }
                ComboBox{
                    id:comboboxStopBit;
                    model: ["1","1.5","2"];

                    width: 120;
                    anchors.right: parent.right;
                    anchors.rightMargin: 10;
                }
            }

            // 流控
            RowLayout{
                id: layoutFlowCtrEnable;
                spacing: 5;
                anchors.left: parent.left;
                anchors.leftMargin: 5;
                anchors.top: layoutStopBit.bottom;
                anchors.topMargin: 5;
                height: 28;
                width: parent.width;
                Layout.alignment:Qt.AlignVCenter;

                Label{
                    id: labelFlowCtrEnable;
                    text: qsTr("FlowCtr");

                    anchors.left: parent.left;
                    anchors.leftMargin: 5;
                }
                ComboBox{
                    id:comboboxFlowCtrEnable;
                    model: ["None","RTS\/CTS","XON\/XOFF"];

                    width: 120;
                    anchors.right: parent.right;
                    anchors.rightMargin: 10;
                }
            }
        }
    }
}

