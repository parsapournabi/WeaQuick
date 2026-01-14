import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {

    signal clicked(var mouse)
    Text {
        anchors.fill: parent

        color: wQuick.theme.textColor[0]
        text: "WeaQuick Button"
    }
    Component.onCompleted: {
        console.log("Theme is: ", wQuick.theme.textColor)
    }
}
