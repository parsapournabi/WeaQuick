import QtQuick 2.12
import QtQuick.Layouts 1.12
import com.wearily.WeaQuick 1.0

Pane {
    id: root
    level: 3

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 5
        Label {
            Layout.fillWidth: true
            Layout.preferredHeight: contentHeight + 10

            horizontalAlignment: Qt.AlignHCenter
            text: "Pane Components in different levels.\n"
                  + "Use Pane component for panels and etc.\n"
                  + "Panes also has default DropShadow which are configurable."
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Pane {
                id: mainPane
                anchors.centerIn: parent
                width: parent.width
                height: parent.height
                level: 0
                Pane {
                    anchors.fill: parent
                    anchors.margins: 35
                    level: 1
                    Pane {
                        anchors.fill: parent
                        anchors.margins: 35
                        level: 2
                        Pane {
                            anchors.fill: parent
                            anchors.margins: 35
                            level: 3
                            Pane {
                                anchors.fill: parent
                                anchors.margins: 35
                                level: 4
                                Pane {
                                    anchors.fill: parent
                                    anchors.margins: 35
                                    level: 5
                                    Pane {
                                        anchors.fill: parent
                                        anchors.margins: 35
                                        level: 6
                                        Pane {
                                            anchors.fill: parent
                                            anchors.margins: 35
                                            level: 7
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
