import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.settings 1.1
import com.wearily.WeaQuick 1.0 as WeaQuick

Rectangle {
    id: root
    color: wQuick.theme.backgroundColor[0]
    WeaQuick.Pane {
        id: headerPane

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10
        height: 60
        level: 3

        WeaQuick.Label {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 30
            font.pointSize: 18
            font.bold: true
            text: "WeaQuick Gallery"
        }
    }

    Item {
        id: mainPane

        anchors.top: headerPane.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10
        anchors.leftMargin: 200

        Loader {
            id: loaderExamplePage
            anchors.fill: parent
        }
    }
    ListView {
        id: listView
        anchors.top: headerPane.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: mainPane.left
        anchors.margins: 10
        spacing: 2

        clip: true
        model: ["Pane", "Button", "FontAwesome"]
        delegate: WeaQuick.Button {
            width: parent.width
            height: 35
            text: modelData
            onClicked: listView.currentIndex = index
        }
        onCurrentIndexChanged: {

            loadExamplePage(model[currentIndex])
        }
    }

    WeaQuick.GlobalContext {
        id: wQuick
        themeComponent: defaultThemeComponent
    }
    Component {
        id: defaultThemeComponent
        WeaQuick.Theme {}
    }
    Component {
        id: lightThemeComponent
        WeaQuick.ThemeLight {}
    }
    function loadExamplePage(name) {
        const path = "file:///C:/Users/PARSA/Desktop/Work/WeaQuick/examples/ExamplesPages/%1/%1Page.qml".arg(
                       name)
        console.log("Loading Example Page: ", path)
        loaderExamplePage.source = ""
        loaderExamplePage.source = path
    }
    Settings {
        id: settings
        property alias pageCurrentIndex: listView.currentIndex
    }
}
