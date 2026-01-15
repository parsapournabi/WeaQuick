import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    id: root

    /** Properties **/
    property int level: 0
    property int levelLabel: 0
    property bool checkable: false
    property bool checked: false

    /** Alias Properties **/
    property alias text: buttonText.text
    property alias cursorShape: mouseArea.cursorShape

    property alias dropShadow: dropShadow
    property alias buttonLabel: buttonText
    property alias mouseArea: mouseArea
    property alias animationBackgroundColor: bgColorAnimation

    /** Signals **/
    signal canceled(var mouse)
    signal clicked(var mouse)
    signal doubleClicked(var mouse)
    signal pressAndHold(var mouse)
    signal pressed(var mouse)
    signal released(var mouse)
    signal toggled(var mouse)

    /** Property assignments **/
    visible: opacity > 0
    width: 100
    height: 30
    radius: 5
    border.width: 2

    /** Shadows & Effects **/
    layer.enabled: true
    layer.effect: DropShadowBinder {
        dropShadowObject: dropShadow
    }

    DropShadowObject {
        id: dropShadow
        // color: "#aa000000"
        samples: 9
        radius: 4
        verticalOffset: 0.0
        horizontalOffset: 0.0
        spread: 0.0
    }

    /** States & Transitions **/
    states: [
        State {
            name: "default"
            when: (!mouseArea.containsMouse && !mouseArea.containsPress)
            PropertyChanges {
                target: root
                color: wQuick.theme.buttonBackgroundColor[level]
                border.color: wQuick.theme.buttonBorderColor[level]
                dropShadow.verticalOffset: 0.0
                dropShadow.horizontalOffset: 0.0
            }
        },
        State {
            name: "hovered"
            when: (mouseArea.containsMouse && !mouseArea.containsPress)
            PropertyChanges {
                target: root
                color: wQuick.theme.buttonHoveredBackgroundColor[level]
                border.color: wQuick.theme.buttonHoveredBorderColor[level]
            }
        },
        State {
            name: "pressed"
            when: (mouseArea.containsMouse && mouseArea.containsPress)
            PropertyChanges {
                target: root
                color: wQuick.theme.buttonSelectedBackgroundColor[level]
                border.color: wQuick.theme.buttonSelectedBorderColor[level]
                dropShadow.verticalOffset: 1.0
                dropShadow.horizontalOffset: 1.0
            }
        }
    ]
    transitions: [
        Transition {
            ColorAnimation {
                id: bgColorAnimation
                duration: 150
            }
        }
    ]

    /** Components **/
    Text {
        id: buttonText
        anchors.centerIn: parent
        color: wQuick.theme.textColor[levelLabel]
        text: "WeaQuick Button"
        font: wQuick.theme.buttonFont[0]
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        acceptedButtons: Qt.AllButtons
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true

        /** Forwarding Signals **/
        onCanceled: {
            root.canceled(mouseArea)
        }
        onClicked: {
            root.clicked(mouseArea)
        }
        onDoubleClicked: {
            root.doubleClicked(mouseArea)
        }
        onPressAndHold: {
            root.pressAndHold(mouseArea)
        }
        onPressed: {
            root.pressed(mouseArea)
        }
        onReleased: {
            root.released(mouseArea)
        }
    }
}
