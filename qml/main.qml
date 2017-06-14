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
        id: layoutSerialSetting;
        height: parent.height;
        width: 200;

        Rectangle{
            id: configPart;
            anchors.fill: parent;
            height: 28;
            color: "#339966";


            GroupBox{
                id: groupboxComSetting;
                anchors.left: parent.left;
                anchors.leftMargin: 2;
                anchors.top: parent.top;
                anchors.topMargin: 2;
                anchors.right: parent.right;
                anchors.rightMargin: 2;
                flat: false;
                title: qsTr("Serial Port setting");
                implicitWidth: parent.width-4;

                // 端口选择
                RowLayout{
                    id: layoutPort;
                    spacing: 2;
                    anchors.left: parent.left;
                    anchors.leftMargin: 0;
                    anchors.top: parent.top;
                    anchors.topMargin: 0;
                    height: 28;
                    width: parent.width;
                    Layout.alignment:Qt.AlignVCenter;

                    Label{
                        id: labelPort;
                        text: qsTr("Port");
                        anchors.left: parent.left;
                    }
                    ComboBox{
                        id:comboboxPort;
                        model: ["COM1","COM2","COM3"];
                        implicitWidth: 100;
                        anchors.right: parent.right;
                    }
                }

                // 波特率
                RowLayout{
                    id: layoutBaud;
                    spacing: 5;
                    anchors.left: parent.left;
                    anchors.leftMargin: 1;
                    anchors.top: layoutPort.bottom;
                    anchors.topMargin: 1;
                    height: 28;
                    width: parent.width;
                    Layout.alignment:Qt.AlignVCenter;

                    Label{
                        id: labelBaud;
                        text: qsTr("BaudRate");
                        anchors.left: parent.left;
                    }
                    ComboBox{
                        id:comboboxBaud;
                        model: ["9600","19200","115200"];
                        implicitWidth: 100;    // 这里如果使用width属性的话,当载入应用后,尺寸会发生变化
                        anchors.right: parent.right;
                    }
                }

                // 数据位
                RowLayout{
                    id: layoutDataBit;
                    spacing: 5;
                    anchors.left: parent.left;
                    anchors.leftMargin: 1;
                    anchors.top: layoutBaud.bottom;
                    anchors.topMargin: 1;
                    height: 28;
                    width: parent.width;
                    Layout.alignment:Qt.AlignVCenter;

                    Label{
                        id: labelDataBit;
                        text: qsTr("DateBit");
                        width: 100;
                        anchors.left: parent.left;
                    }
                    ComboBox{
                        id:comboboxDataBit;
                        model: ["5","6","7","8","9"];
                        implicitWidth: 100;
                        anchors.right: parent.right;
                    }
                }

                // 校验位
                RowLayout{
                    id: layoutParityBit;
                    spacing: 5;
                    anchors.left: parent.left;
                    anchors.leftMargin: 1;
                    anchors.top: layoutDataBit.bottom;
                    anchors.topMargin: 1;
                    height: 28;
                    width: parent.width;
                    Layout.alignment:Qt.AlignVCenter;

                    Label{
                        id: labelParityBit;
                        text: qsTr("ParityBit");
                        anchors.left: parent.left;
                    }
                    ComboBox{
                        id:comboboxParityBit;
                        model: ["None","Even","Odd","Mark","Space"];
                        implicitWidth: 100;
                        anchors.right: parent.right;
                    }
                }

                // 停止位
                RowLayout{
                    id: layoutStopBit;
                    spacing: 5;
                    anchors.left: parent.left;
                    anchors.leftMargin: 1;
                    anchors.top: layoutParityBit.bottom;
                    anchors.topMargin: 1;
                    height: 28;
                    width: parent.width;
                    Layout.alignment:Qt.AlignVCenter;

                    Label{
                        id: labelStopBit;
                        text: qsTr("StopBit");
                        anchors.left: parent.left;
                    }
                    ComboBox{
                        id:comboboxStopBit;
                        model: ["1","1.5","2"];
                        implicitWidth: 100;
                        anchors.right: parent.right;
                    }
                }

                // 流控
                RowLayout{
                    id: layoutFlowCtrEnable;
                    spacing: 5;
                    anchors.left: parent.left;
                    anchors.leftMargin: 1;
                    anchors.top: layoutStopBit.bottom;
                    anchors.topMargin: 1;
                    height: 28;
                    width: parent.width;
                    Layout.alignment:Qt.AlignVCenter;

                    Label{
                        id: labelFlowCtrEnable;
                        text: qsTr("FlowCtr");
                        anchors.left: parent.left;
                    }
                    ComboBox{
                        id:comboboxFlowCtrEnable;
                        model: ["None","RTS\/CTS","XON\/XOFF"];
                        implicitWidth: 100;
                        anchors.right: parent.right;
                    }
                }
            }

            GroupBox{
                id: groupboxReceiveSetting;
                anchors.left: parent.left;
                anchors.leftMargin: 2;
                anchors.top: groupboxComSetting.bottom;
                anchors.topMargin: 2;
                anchors.right: parent.right;
                anchors.rightMargin: 2;
                flat: false;
                title: qsTr("Receive setting");
                implicitWidth: parent.width-4;

                // 接收数据格式
                RowLayout{
                    id: layoutReceFormat;
                    spacing: 5;
                    anchors.left: parent.left;
                    anchors.leftMargin: 1;
                    anchors.top: parent.top;
                    anchors.topMargin: 1;
                    height: 28;
                    width: parent.width;
                    Layout.alignment:Qt.AlignVCenter;

                    RadioButton{
                        id: radiobtnReceiveFormatHex;
                        text: qsTr("Hex");
                        anchors.left: parent.left;
                        checked: false;

                        onClicked: {
                            if(checked == true){
                                radiobtnReceiveFormatTxt.checked = false;
                            }else{
                                radiobtnReceiveFormatTxt.checked = true;
                            }
                        }
                    }
                    RadioButton{
                        id: radiobtnReceiveFormatTxt;
                        text: qsTr("Text");
                        anchors.right: parent.right;
                        checked: (radiobtnReceiveFormatHex.checked != true)? true:false;

                        onClicked: {
                            if(checked == true){
                                radiobtnReceiveFormatHex.checked = false;
                            }else{
                                radiobtnReceiveFormatHex.checked = true;
                            }
                        }
                    }
                }

                // 时间显示使能
                RowLayout{
                    id: layoutRecTimeShowEnable;
                    spacing: 5;
                    anchors.left: parent.left;
                    anchors.leftMargin: 1;
                    anchors.top: layoutReceFormat.bottom;
                    anchors.topMargin: 1;
                    height: 28;
                    width: parent.width;
                    Layout.alignment:Qt.AlignVCenter;

                    CheckBox{
                        id: checkboxRecShowTimeEnable;
                        text: qsTr("Show Time");
                        anchors.left: parent.left;
                    }
                }

                // 自动换行
                RowLayout{
                    id: layoutRecAutoWrap;
                    spacing: 5;
                    anchors.left: parent.left;
                    anchors.leftMargin: 1;
                    anchors.top: layoutRecTimeShowEnable.bottom;
                    anchors.topMargin: 1;
                    height: 28;
                    width: parent.width;
                    Layout.alignment:Qt.AlignVCenter;

                    CheckBox{
                        id: checkboxRecAutoWrap;
                        text: qsTr("Atuo Wrap");
                        anchors.left: parent.left;
                    }
                }

                // 显示发送内容
                RowLayout{
                    id: layoutShowSendContent;
                    spacing: 5;
                    anchors.left: parent.left;
                    anchors.leftMargin: 1;
                    anchors.top: layoutRecAutoWrap.bottom;
                    anchors.topMargin: 1;
                    height: 28;
                    width: parent.width;
                    Layout.alignment:Qt.AlignVCenter;

                    CheckBox{
                        id: checkboxShowSendContent;
                        text: qsTr("Show Send Content");
                        anchors.left: parent.left;
                    }
                }
            }

            // 发送设置
            GroupBox{
                id: groupboxSendSetting;
                anchors.left: parent.left;
                anchors.leftMargin: 2;
                anchors.top: groupboxReceiveSetting.bottom;
                anchors.topMargin: 2;
                anchors.right: parent.right;
                anchors.rightMargin: 2;
                implicitWidth: parent.width-4;
                flat: false;
                title: qsTr("Send setting");

                // 接收数据格式
                RowLayout{
                    id: layoutSendFormat;
                    spacing: 5;
                    anchors.left: parent.left;
                    anchors.leftMargin: 1;
                    anchors.top: parent.top;
                    anchors.topMargin: 1;
                    height: 28;
                    width: parent.width;
                    Layout.alignment:Qt.AlignVCenter;

                    RadioButton{
                        id: radiobtnSendFormatHex;
                        text: qsTr("Hex");
                        anchors.left: parent.left;
                        checked: false;

                        onClicked: {
                            if(checked == true){
                                radiobtnSendFormatTxt.checked = false;
                            }else{
                                radiobtnSendFormatTxt.checked = true;
                            }
                        }
                    }
                    RadioButton{
                        id: radiobtnSendFormatTxt;
                        text: qsTr("Text");
                        anchors.right: parent.right;
                        checked: (radiobtnSendFormatHex.checked != true)? true:false;

                        onClicked: {
                            if(checked == true){
                                radiobtnSendFormatHex.checked = false;
                            }else{
                                radiobtnSendFormatHex.checked = true;
                            }
                        }
                    }
                }

                // 连续发送
                RowLayout{
                    id: layoutSendContinuousEnable;
                    anchors.left: parent.left;
                    anchors.leftMargin: 1;
                    anchors.top: layoutSendFormat.bottom;
                    anchors.topMargin: 1;
                    height: 28;
                    width: parent.width;
                    Layout.alignment:Qt.AlignLeft;

                    CheckBox{
                        id: checkboxSendContinuousEnable;
                        text: qsTr("Continuous");
                        anchors.left: parent.left;
                    }

                    Rectangle{
                        implicitWidth: 100;
                        implicitHeight: 28;
                        anchors.right: parent.right;
                        color: configPart.color;

                        RowLayout{
                            id:layoutSendInterval;
                            height: 28;
                            anchors.right: parent.right;
                            Layout.alignment: Qt.AlignRight;

                            TextField{
                                id: textfieldSendInterval;
                                textColor: (checkboxSendContinuousEnable.checked != true)? "#FF0033":"#336633";
                                maximumLength: 16;
                                implicitWidth: 80;
                                text: qsTr("1000");
                                horizontalAlignment: TextInput.AlignRight;
                            }

                            Label{
                                id: labelSendContinuousDanwei;
                                anchors.left: textfieldSendInterval.right;
                                anchors.leftMargin: 2;
                                text: qsTr("ms");
                            }
                        }
                    }
                }
            }

            // 控制按钮
            RowLayout{
                id: layoutPortControl;
                spacing: 5;
                anchors.left: parent.left;
                anchors.leftMargin: 1;
                anchors.top: groupboxSendSetting.bottom;
                anchors.topMargin: 30;
                height: 30;
                width: parent.width;
                Layout.alignment:Qt.AlignHCenter;

                Item {
                    width: 45;
                }

                Rectangle{
                    id: rectangleSerialPortOpen;
                    implicitWidth: 30;
                    implicitHeight: 30;
                    color: configPart.color;

                    focus: true;

                    Image {
                        id: imageSerialPortOpen;
                        height: rectangleSerialPortOpen.implicitHeight;
                        width: rectangleSerialPortOpen.implicitWidth;
                        source: "qrc:///img/start.png";
                        fillMode: Image.Stretch;
                    }

                    MouseArea{
                        id: btnSerialPortOpen;
                        anchors.fill: parent;
                        hoverEnabled: true;

                        onEntered: {
                            rectangleSerialPortOpen.border.width = 1;
                            rectangleSerialPortOpen.border.color = "#FFFFFF";
                        }
                        onExited: {
                            rectangleSerialPortOpen.border.width = 0;
                        }

                        onPressed: {
                            imageSerialPortOpen.source = "qrc:///img/start_75.png";
                        }

                        onReleased: {
                            imageSerialPortOpen.source = "qrc:///img/start.png";
                        }
                    }
                }

                Rectangle{
                    id: rectangleSerialPortPause;
                    implicitWidth: 30;
                    implicitHeight: 30;
                    color: configPart.color;

                    focus: true;

                    Image {
                        id: imageSerialPortPause;
                        height: rectangleSerialPortPause.implicitHeight;
                        width: rectangleSerialPortPause.implicitWidth;
                        source: "qrc:///img/pause.png";
                        fillMode: Image.Stretch;
                    }

                    MouseArea{
                        id: btnSerialPortPause;
                        anchors.fill: parent;
                        hoverEnabled: true;

                        onEntered: {
                            rectangleSerialPortPause.border.width = 1;
                            rectangleSerialPortPause.border.color = "#FFFFFF";
                        }
                        onExited: {
                            rectangleSerialPortPause.border.width = 0;
                        }

                        onPressed: {
                            imageSerialPortPause.source = "qrc:///img/pause_75.png";
                        }

                        onReleased: {
                            imageSerialPortPause.source = "qrc:///img/pause.png";
                        }
                    }
                }

                Rectangle{
                    id: rectangleSerialPortStop;
                    implicitWidth: 30;
                    implicitHeight: 30;
                    color: configPart.color;

                    focus: true;

                    Image {
                        id: imageSerialPortStop;
                        height: rectangleSerialPortStop.implicitHeight;
                        width: rectangleSerialPortStop.implicitWidth;
                        source: "qrc:///img/stop.png";
                        fillMode: Image.Stretch;
                    }

                    MouseArea{
                        id: btnSerialPortStop;
                        anchors.fill: parent;
                        hoverEnabled: true;

                        onEntered: {
                            rectangleSerialPortStop.border.width = 1;
                            rectangleSerialPortStop.border.color = "#FFFFFF";
                        }
                        onExited: {
                            rectangleSerialPortStop.border.width = 0;
                        }

                        onPressed: {
                            imageSerialPortStop.source = "qrc:///img/stop_75.png";
                        }

                        onReleased: {
                            imageSerialPortStop.source = "qrc:///img/stop.png";
                        }
                    }
                }

                Item {
                    width: 45;
                }

            }
        }
    }

    Rectangle{
        id: rectangleSendAndReceiveDis;
        anchors.left: layoutSerialSetting.right;
        anchors.top: parent.top;
        implicitWidth: parent.width - 200;
        implicitHeight: parent.height;
        color: "#FFFFFF";

        ColumnLayout{
            id: layoutSendAndReceiveDis;
            width: parent.width - layoutSerialSetting.width;
            anchors.left: rectangleSendAndReceiveDis.left;
            anchors.leftMargin: 2;
            spacing: 4;
            anchors.top: parent.top;

            TextArea{
                id: textareaReceivedDataDis;

                implicitHeight: rectangleSendAndReceiveDis.height*2/3;
                implicitWidth: rectangleSendAndReceiveDis.width-4;
                anchors.left: rectangleSendAndReceiveDis.left;
                anchors.leftMargin: 2;
            }

            TextArea{

            }

            ComboBox{

            }
        }
    }
}

