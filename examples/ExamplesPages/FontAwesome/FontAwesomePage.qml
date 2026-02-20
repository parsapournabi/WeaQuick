import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQml.Models 2.12
import QtQuick.Controls 2.12
import com.wearily.WeaQuick 1.0

Pane {
    id: root
    level: 3
    property var sourceData: Object.keys(FontAwesome.icons)
    property var filteredData: sourceData

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 5
        Label {
            Layout.fillWidth: true
            Layout.preferredHeight: contentHeight + 10

            horizontalAlignment: Qt.AlignHCenter
            text: "Font Awesome Pro Solid Icons.\n"
        }

        TextEdit {
            id: searchField
            Layout.fillWidth: true
            // placeholderText: "Search..."
            onTextChanged: applyFilter(text)
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            GridView {
                id: grid
                anchors.fill: parent
                anchors.margins: 30
                clip: true
                cellWidth: 50
                cellHeight: 50
                model: filteredData
                delegate: Text {
                    font.family: "Font Awesome 6 Pro Solid"
                    // font.family: "FontAwesome"
                    // font.family: "Military RPG"
                    font.pixelSize: 16
                    text: "%1".arg(FontAwesome.icons[modelData])
                    color: wQuick.theme.textColor[0]
                    MouseArea {
                        id: mouseContains
                        anchors.fill: parent
                        hoverEnabled: true
                    }

                    ToolTip {
                        delay: 500
                        visible: mouseContains.containsMouse
                        text: "%1".arg(modelData)
                    }
                }
            }
        }
    }
    function applyFilter(text) {
        if (!text || text === "") {
            filteredData = sourceData
            return
        }

        var pattern = text.toLowerCase()

        filteredData = sourceData.filter(function (item) {
            return item.toLowerCase().indexOf(pattern) !== -1
        })
    }
}
