import QtQuick 2.9
import Ubuntu.Components 1.3
import QtQuick.Window 2.2
import Morph.Web 0.1
import QtWebEngine 1.7
import Qt.labs.settings 1.0
import QtSystemInfo 5.5
import "components"


MainView {
    id:window
    //
    // ScreenSaver {
    //   id: screenSaver
    //   screenSaverEnabled: !(Qt.application.active)
    // }

    objectName: "mainView"
    theme.name: "Ubuntu.Components.Themes.SuruDark"
    backgroundColor: "transparent"
    applicationName: "zvvfahrplan.ste-kal"
    focus: true
    anchorToKeyboard: true
    automaticOrientation: true
    property bool blockOpenExternalUrls: false
    property bool runningLocalApplication: false
    property bool openExternalUrlInOverlay: false
    property bool popupBlockerEnabled: true

    property string title: "ZVV Fahrplan"

    property string myUrl: "https://online.fahrplan.zvv.ch/bin/query.exe/dn.html"
    property string myUA: "Mozilla/5.0 (Linux; U; Android 4.1.1; es-; AVA-V470 Build/GRK39F) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1"

    property var myZOOM: 2.5

    Page{

        id: page
        header: Rectangle {
            color: "#000000"
            width: parent.width
            height: units.dp(.5)
            z: 1
        }    
        
        anchors {
            fill: parent
            bottom: parent.bottom
        }

        WebEngineView {
            id: webview
            anchors {
                fill: parent
            }
            //settings.localStorageEnabled: true
            //settings.allowFileAccessFromFileUrls: true
            //settings.allowUniversalAccessFromFileUrls: true
            //settings.appCacheEnabled: true
            settings.javascriptCanAccessClipboard: true
            settings.fullScreenSupportEnabled: true
            property var currentWebview: webview
            settings.pluginsEnabled: true


            onFullScreenRequested: function(request) {
                mainview.fullScreenRequested(request.toggleOn);
                nav.visible = !nav.visible
                request.accept();
            }
            property string test: writeToLog("DEBUG","my URL:", myUrl);
            property string test2: writeToLog("DEBUG","PixelRatio:", Screen.devicePixelRatio);
            function writeToLog(mylevel,mytext, mymessage){
                console.log("["+mylevel+"]  "+mytext+" "+mymessage)
                return(true);
            }

            profile:  WebEngineProfile {
                id: webContext
                persistentCookiesPolicy: WebEngineProfile.ForcePersistentCookies
                property alias dataPath: webContext.persistentStoragePath
                property alias userAgent: webContext.httpUserAgent

                dataPath: dataLocation
                userAgent: myUA
            }

            anchors {
                fill:parent
                centerIn: parent.verticalCenter
            }
            zoomFactor: myZOOM
            url: myUrl
            userScripts: [
                WebEngineScript {
                    injectionPoint: WebEngineScript.DocumentCreation
                    worldId: WebEngineScript.MainWorld
                    name: "QWebChannel"
                    sourceUrl: "../uttheme.js"
                }
            ]
        }
    }
    BottomMenu {
        id: bottomMenu
        width: parent.width
    }

}


