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
            text: "Simple Button Example.\n"
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            ColumnLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 20
                Button {
                    text: "Play"
                }
                Button {
                    text: "Play"
                    icon: FontAwesome.icons.play
                }
                Button {
                    text: "Play"
                    icon: FontAwesome.icons.play
                    layoutDirection: Qt.RightToLeft
                }
                Button {
                    icon: FontAwesome.icons.play
                }
                Button {
                    text: "Disabled"
                    enabled: false
                }

                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
        }
    }
}
