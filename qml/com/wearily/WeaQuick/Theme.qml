import QtQuick 2.12

QtObject {
    id: root

    /** Panes **/
    property var paneBackgroundColor: []
    property var paneBorderColor: []

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
