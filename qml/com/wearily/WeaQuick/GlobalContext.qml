import QtQuick 2.12

Item {
    id: root

    property Component themeComponent: Component {
        Theme {}
    }

    property alias theme: themeLoader.item

    Loader {
        id: themeLoader
        sourceComponent: themeComponent
    }
}
