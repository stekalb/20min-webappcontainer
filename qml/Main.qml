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
    applicationName: "20minch.ste-kal"
    focus: true
    anchorToKeyboard: true
    automaticOrientation: true
    property bool blockOpenExternalUrls: false
    property bool runningLocalApplication: false
    property bool openExternalUrlInOverlay: false
    property bool popupBlockerEnabled: true

    property string title: "20 Minuten CH"

    property var myTabletPixelDensity: 8.88888888888889
    property var myTabletPixelDensityB: 9.88888888888889
    property var myTabletPixelDensityC: 9.48931735278791

    property var myTabletZOOM: 1.8
    property var myMobileZOOM: 2.5

    property string myTabletUrl: "https://www.20min.ch"
    property string myMobileUrl: "https://m.20min.ch"
    property string myTabletUA: "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0"
    property string myMobileUA: "Mozilla/5.0 (Linux; Android 8.0.0; Pixel Build/OPR3.170623.007) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.98 Mobile Safari/537.36"

    property string myUrl: (Screen.pixelDensity == myTabletPixelDensity || Screen.pixelDensity == myTabletPixelDensityB) ? myTabletUrl : myMobileUrl
    property string myUA: (Screen.pixelDensity == myTabletPixelDensity || Screen.pixelDensity == myTabletPixelDensityB) ? myTabletUA : myMobileUA
    property string myZOOM: (Screen.pixelDensity == myTabletPixelDensity || Screen.pixelDensity == myTabletPixelDensityB) ? myTabletZOOM : myMobileZOOM

    function writeToLog(mylevel,mytext, mymessage){
        console.log("["+mylevel+"]  "+mytext+" "+mymessage)
        return(true);
    }

    property string test: writeToLog("DEBUG","A: my URL:", myUrl);
    property string testua: writeToLog("DEBUG","A: my UA:", myUA);
    property string testzoom: writeToLog("DEBUG","A: my UA:", myZOOM);
    property string test2: writeToLog("DEBUG","B: DevicePixelRatio:", Screen.devicePixelRatio);
    property string test3: writeToLog("DEBUG","C: PixelDensity:", Screen.pixelDensity);
    property string test4: writeToLog("DEBUG","D: Screen model:", Screen.model);
    property string test5: writeToLog("DEBUG","E: Screen manufacturer:", Screen.manufacturer);

  //  property var myZOOM: 2.5

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

            settings.javascriptCanAccessClipboard: true
            settings.fullScreenSupportEnabled: true
            property var currentWebview: webview
            settings.pluginsEnabled: true


            onFullScreenRequested: function(request) {
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


