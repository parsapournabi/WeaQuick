import QtQuick 2.12
import QtQuick.Controls 2.12 as Q

Q.Label {
    id: root

    /** Properties **/
    property int level: 0
    property int fontLevel: 0

    /** Alias Properties **/
    property alias dropShadow: dropShadow

    /** Property Assignment **/
    font: wQuick.theme.labelFont[fontLevel]
    color: wQuick.theme.textColor[level]

    layer.enabled: true
    layer.effect: DropShadowBinder {
        dropShadowObject: dropShadow
    }
    DropShadowObject {
        id: dropShadow
        color: "white"
        radius: 2
    }
}
