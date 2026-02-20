import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12 as Q

/// TODO: Add Normal Icon which uses Image component at base and load that with Loader (iconFont, iconPixmap, .etc).
Rectangle {
    id: root

    /** Properties **/
    property int level: 0
    property int levelLabel: 0
    property bool checkable: false
    property bool checked: false


    /*
        display : enumeration -> Referer AbstractButton Display
        AbstractButton.IconOnly
        AbstractButton.TextOnly
        AbstractButton.TextBesideIcon (default)
        AbstractButton.TextUnderIcon
    */
    property int display: Q.AbstractButton.TextBesideIcon
    property bool invert: true

    /** Alias Properties **/
    property alias text: label.text
    property alias icon: icon.name
    property alias spacing: layout.spacing
    property alias cursorShape: mouseArea.cursorShape
    property alias layoutDirection: layout.layoutDirection
    property alias textVerticalAlignment: label.verticalAlignment
    property alias textHorizontalAlignment: label.horizontalAlignment
    property alias iconVerticalAlignment: icon.verticalAlignment
    property alias iconHorizontalAlignment: icon.horizontalAlignment

    property alias label: label
    property alias iconItem: icon
    property alias dropShadow: dropShadow
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
            when: (enabled && !mouseArea.containsMouse
                   && !mouseArea.containsPress)
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
            when: (enabled && mouseArea.containsMouse
                   && !mouseArea.containsPress)
            PropertyChanges {
                target: root
                color: wQuick.theme.buttonHoveredBackgroundColor[level]
                border.color: wQuick.theme.buttonHoveredBorderColor[level]
            }
        },
        State {
            name: "pressed"
            when: (enabled && mouseArea.containsMouse
                   && mouseArea.containsPress)
            PropertyChanges {
                target: root
                color: wQuick.theme.buttonSelectedBackgroundColor[level]
                border.color: wQuick.theme.buttonSelectedBorderColor[level]
                dropShadow.verticalOffset: 1.0
                dropShadow.horizontalOffset: 1.0
            }
        },
        State {
            name: "disabled"
            when: !enabled
            PropertyChanges {
                target: root
                color: Qt.lighter(wQuick.theme.buttonBackgroundColor[level],
                                  0.6)
                border.color: color
                label.color: Qt.darker(wQuick.theme.textColor[levelLabel], 3.0)
                dropShadow.verticalOffset: 0.0
                dropShadow.horizontalOffset: 0.0
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
    RowLayout {
        id: layout
        anchors {
            fill: parent
            margins: 5
        }
        spacing: 8
        clip: true

        IconFont {
            id: icon
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 5
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: !label.visible ? Qt.AlignHCenter : layout.layoutDirection
                                                  === Qt.LeftToRight ? Qt.AlignRight : Qt.AlignLeft
            visible: name.length > 0
            name: ""
        }

        Label {
            id: label
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 10
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: !icon.visible ? Qt.AlignHCenter : layout.layoutDirection
                                                 === Qt.LeftToRight ? Qt.AlignLeft : Qt.AlignRight
            visible: text || text !== ""
        }
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
