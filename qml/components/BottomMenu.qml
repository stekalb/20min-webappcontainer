import QtQuick 2.9
import Morph.Web 0.1
import QtWebEngine 1.7
import Ubuntu.Components 1.3
import QtQuick.Window 2.2
import QtQuick.LocalStorage 2.0
import Ubuntu.Components.Popups 1.3
import Ubuntu.Content 1.1
import Qt.labs.settings 1.0
import QtSystemInfo 5.5

Rectangle {
  id: bottomMenu
  z: 100000
  width: parent.width
  height: units.gu(4)
  color: "#0479cc"

  anchors {
    bottom: parent.bottom
  }

  Row {
    width: parent.width
    height: parent.height-units.gu(0.1)
    anchors {
      centerIn: parent
    }

    Item {
      width: parent.width/3
      height: parent.height

      Icon {
        anchors.centerIn: parent
        width: units.gu(2.2)
        height: width
        name: "go-previous"
        color: "#ffffff"
      }

      MouseArea {
        anchors.fill: parent
        onClicked: {
          webview.goBack()
        }
      }
    }

    Item {
      width: parent.width/3
      height: parent.height

      Icon {
        anchors.centerIn: parent
        width: units.gu(2.2)
        height: width
        source: Qt.resolvedUrl("../icons/home.svg")
        color: "#ffffff"
      }

      MouseArea {
        property string myTabletUrl: "https://www.20min.ch"
        property string myMobileUrl: "https://m.20min.ch"
        property string myUrl: (Screen.devicePixelRatio == 1.625) ? myTabletUrl : myMobileUrl
        anchors.fill: parent
        onClicked: webview.url=myUrl
      }
    }

    Item {
      width: parent.width/3
      height: parent.height

      Icon {
        anchors.centerIn: parent
        width: units.gu(2.2)
        height: width
        name: "reload"
        color: "#ffffff"
      }

      MouseArea {
        anchors.fill: parent
        onClicked: {
          webview.reload()
        }
      }
    }
  }
}
