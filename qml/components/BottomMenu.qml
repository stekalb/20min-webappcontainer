import QtQuick 2.9
import Ubuntu.Web 0.2
import Ubuntu.Components 1.3
import QtQuick.LocalStorage 2.0
import Ubuntu.Components.Popups 1.3
import Ubuntu.Content 1.1

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
      width: parent.width/4
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
      width: parent.width/4
      height: parent.height

      Icon {
        anchors.centerIn: parent
        width: units.gu(2.2)
        height: width
        source: Qt.resolvedUrl("../icons/home.svg")
        color: "#ffffff"
      }

      MouseArea {
        anchors.fill: parent
        onClicked: webview.url="https://online.fahrplan.zvv.ch/bin/query.exe/dn.html"
      }
    }

    Item {
      width: parent.width/4
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

    Item {
      width: parent.width/4
      height: parent.height

      Icon {
        anchors.centerIn: parent
        width: units.gu(2.2)
        height: width
        source: Qt.resolvedUrl("../icons/flash-on.svg")
        color: "#ffffff"
      }

      MouseArea {
        anchors.fill: parent
        onClicked: webview.url="https://online.fahrplan.zvv.ch/bin/help.exe/dn?tpl=himmap"
      }
    }
  }
}
