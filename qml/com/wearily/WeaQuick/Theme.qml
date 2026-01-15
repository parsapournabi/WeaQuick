import QtQuick 2.12

QtObject {
    id: root

    /** Panes **/
    property var paneBackgroundColor: ["#050505", "#0A0A0A", "#0F0E0F", "#262426", "#302D30", "#4D474B", "#696066", "#7A7077"]
    property var paneBorderColor: ["#050505", "#0A0A0A", "#0F0E0F", "#262426", "#302D30", "#4D474B", "#696066", "#7A7077"]

    /** Texts **/
    property var textColor: ["green"]
    property var textHoveredColor: []
    property var textSelectedColor: []

    /** Buttons **/
    property var buttonBackgroundColor: []
    property var buttonHoveredBackgroundColor: []
    property var buttonSelectedBackgroundColor: []

    property var buttonBorderColor: []
    property var buttonHoveredBorderColor: []
    property var buttonSelectedBorderColor: []

    /** ScrollBars **/
    property var scrollHandlerBackgroundColor: []
    property var scrollHandlerHoveredBackgroundColor: []
    property var scrollHandlerSelectedBackgroundColor: []

    property var scrollHandlerBorderColor: []
    property var scrollHandlerHoveredBorderColor: []
    property var scrollHandlerSelectedBorderColor: []
}
