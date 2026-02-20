#include <QGuiApplication>
#include <QSettings>
#include <QDebug>

#include "CustomEngine.h"

#include "WeaQuick/initialize.h"

/// TODO: Multi State Button (Clicks Define By user the number of steps & Styles)
/// TODO: add SideMenu Component with optional overlay effect.

int main(int argc, char* argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    QGuiApplication::setOrganizationName("QtWea");
    QGuiApplication::setOrganizationDomain("com.wearily");
    QGuiApplication::setApplicationName("WeaQuick Gallery");
    QSettings settings;
    qDebug() << "Settings: " << settings.applicationName()
             << settings.organizationName();

    QString mainQmlPath = QString("%1/main.qml").arg(PROJECT_SOURCE_DIR);
    CustomEngine engine;
    // const QUrl url(QStringLiteral("qrc:/main.qml"));
    const QUrl url(QUrl::fromLocalFile(mainQmlPath));
    QObject::connect(
        &engine,
        &CustomEngine::objectCreated,
        &app,
        [url](QObject * obj, const QUrl & objUrl)
    {
        if (!obj && url == objUrl)
        {
            QCoreApplication::exit(-1);
        }
    },
    Qt::QueuedConnection);

    WeaQuick::initialize(&engine);

    engine.rootContext()->setContextProperty("_qmlEngine", &engine);



    QString qmlDir = QString("%1/../qml").arg(PROJECT_SOURCE_DIR);
    engine.addImportPath(qmlDir);
    qDebug() << engine.importPathList();
    engine.load(url);

    return app.exec();
}
