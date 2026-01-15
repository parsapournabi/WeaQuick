import QtQuick 2.12

QtObject {
    id: root

    /** Backgrounds **/
    property var backgroundColor: ["#000000"]

    /** Panes **/
    property var paneBackgroundColor: ["#050505", "#0A0A0A", "#0F0E0F", "#262426", "#302D30", "#4D474B", "#696066", "#7A7077"]
    property var paneBorderColor: ["#050505", "#0A0A0A", "#0F0E0F", "#262426", "#302D30", "#4D474B", "#696066", "#7A7077"]

    /** Texts **/
    property var textColor: ["#FFFFFF"]
    property var textHoveredColor: ["#FFFFFF"]
    property var textSelectedColor: ["#FFFFFF"]

    /** Buttons **/
    property var buttonBackgroundColor: ["#2B2A29"]
    property var buttonHoveredBackgroundColor: ["#404040"]
    property var buttonSelectedBackgroundColor: ["#313131"]

    property var buttonBorderColor: ["#6663607", "#1A1918"]
    property var buttonHoveredBorderColor: ["#404040"]
    property var buttonSelectedBorderColor: ["#000000"]

    /** ScrollBars **/
    property var scrollHandlerBackgroundColor: []
    property var scrollHandlerHoveredBackgroundColor: []
    property var scrollHandlerSelectedBackgroundColor: []

    property var scrollHandlerBorderColor: []
    property var scrollHandlerHoveredBorderColor: []
    property var scrollHandlerSelectedBorderColor: []

    /** Fonts **/

    /** Label Fonts **/
    property var labelFont: [Qt.font({
                                         "family": "FontAwesome",
                                         "weight": Font.DemiBold,
                                         "bold": false,
                                         "pixelSize": 12
                                     })]

    /** Buttons Fonts **/
    property var buttonFont: [Qt.font({
                                          "family": "FontAwesome",
                                          "weight": Font.DemiBold,
                                          "bold": false,
                                          "pixelSize": 13
                                      })]
}
