cmake_minimum_required(VERSION 3.16)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core Qml Quick)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Qml Quick)

add_executable(${MODULE_NAME}Example main.cpp
    qml.qrc
    CustomEngine.h
    )

add_compile_definitions(PROJECT_SOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}")

list(APPEND QML_IMPORT_PATH "C:/Users/PARSA/Desktop/Work/WeaQuick/qml/")
list(APPEND QT_QML_IMPORT_PATH "C:/Users/PARSA/Desktop/Work/WeaQuick/qml/")
# set(QML_IMPORT_PATH "")

target_link_libraries(${MODULE_NAME}Example
    PRIVATE
        Qt${QT_VERSION_MAJOR}::Core
        Qt${QT_VERSION_MAJOR}::Qml
        Qt${QT_VERSION_MAJOR}::Quick
    PUBLIC
        ${MODULE_NAME}
)
