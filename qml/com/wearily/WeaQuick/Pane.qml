import QtQuick 2.0
import QtGraphicalEffects 1.15

Rectangle {
    id: root

    /** Properties **/
    property int level: 0

    /** Alias Properties **/
    property alias dropShadow: dropShadow

    /** Property Assignments **/
    width: 300
    height: 300
    radius: 7.5
    color: wQuick.theme.paneBackgroundColor[level]
    border.color: wQuick.theme.paneBorderColor[level]

    /** Shadows & Effects **/
    layer.enabled: true
    layer.effect: DropShadowBinder {
        dropShadowObject: dropShadow
    }

    DropShadowObject {
        id: dropShadow
        color: "#aa000000"
        samples: 4
        radius: 3
        verticalOffset: 4.0
        horizontalOffset: 2.0
        spread: .05
    }
}
