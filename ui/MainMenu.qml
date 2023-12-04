/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *                                                                         *
 *  Copyright (C) 2015 Simon Stuerz <stuerz.simon@gmail.com>               *
 *                                                                         *
 *  This file is part of Monster Wars.                                     *
 *                                                                         *
 *  Monster Wars is free software: you can redistribute it and/or modify   *
 *  it under the terms of the GNU General Public License as published by   *
 *  the Free Software Foundation, version 3 of the License.                *
 *                                                                         *
 *  Monster Wars is distributed in the hope that it will be useful,        *
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of         *
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the           *
 *  GNU General Public License for more details.                           *
 *                                                                         *
 *  You should have received a copy of the GNU General Public License      *
 *  along with Monster Wars. If not, see <http://www.gnu.org/licenses/>.   *
 *                                                                         *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

import QtQuick 2.4
import Lomiri.Components 1.3
import Lomiri.Thumbnailer 0.1

Page {
    id: mainPage
    head {
        visible: false
        locked: true
    }

    Rectangle {
        anchors.fill: parent
        color: "black"

        Image {
            id: backgroundImage
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            sourceSize: Qt.size(parent.width, 0)
            source: "image://thumbnailer/" + Qt.resolvedUrl(dataDirectory + "/backgrounds/menu-background.jpg")
        }


        BackgroundMonsters {
            anchors.fill: parent
        }

        Rectangle {
            id: playButton
            anchors.centerIn: parent
            height: units.gu(15)
            width: units.gu(40)
            anchors.horizontalCenter: parent.horizontalCenter

            color: "transparent"

            Image {
                id: playButtonMonster
                anchors.fill: parent
                source: "qrc:///images/play-button.png"
            }

            Text {
                anchors.centerIn: parent
                // TRANSLATORS: The "Play" button in the main menu
                text: i18n.tr("Play")
                font.bold: true
                font.pixelSize: units.gu(4)
                color: playButtonMouseArea.pressed ? "steelblue" : "white"
            }

            MouseArea {
                id: playButtonMouseArea
                anchors.fill: parent
                onClicked: pageStack.push(Qt.resolvedUrl("LevelSelector.qml"))
            }
        }

        SequentialAnimation {
            id: playButtonAnimation
            ScaleAnimator {
                target: playButton
                from: 0.99
                to: 1.03
                easing.type: Easing.Linear;
                duration: 1000
            }
            ScaleAnimator {
                target: playButton
                from: 1.03
                to: 0.99
                easing.type: Easing.Linear;
                duration: 800
            }
            running: true
            loops: Animation.Infinite
        }
    }

    Rectangle {
        id: infoButton
        width: units.gu(6)
        height: width
        anchors.left: parent.left
        anchors.leftMargin: units.gu(3)
        anchors.bottom: parent.bottom
        anchors.bottomMargin: units.gu(3)
        color: "black"
        radius: width / 2

        Text {
            anchors.centerIn: parent
            // TRANSLATORS: The "i" in the information button in the main menu
            text: i18n.tr("i")
            color: "white"
            font.bold: true
            font.pixelSize: units.gu(4)
        }

        MouseArea {
            id: infoMouseArea
            anchors.fill: parent
            onClicked: pageStack.push(Qt.resolvedUrl("About.qml"))
        }
    }


    Rectangle {
        id: muteButton
        width: units.gu(6)
        height: width
        anchors.right: parent.right
        anchors.rightMargin: units.gu(3)
        anchors.bottom: parent.bottom
        anchors.bottomMargin: units.gu(3)
        color: "black"
        radius: width / 2

        Image {
            id: muteImage
            anchors.fill: parent
            anchors.margins: units.gu(1)
            source: gameEngine.playerSettings.muted ? "qrc:///images/unmute.png" : "qrc:///images/mute.png"
        }

        MouseArea {
            id: muteButtonMouseArea
            anchors.fill: parent
            onClicked: {
                gameEngine.playerSettings.muted = !gameEngine.playerSettings.muted
                app.updateMusic()
            }
        }
    }

    Rectangle {
        id: settingsButton
        width: units.gu(7)
        height: width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: units.gu(3)
        color: "black"
        radius: width / 2

        Image {
            id: settingsImage
            anchors.fill: parent
            anchors.margins: units.gu(1)
            source: "qrc:///images/settings.png"
        }

        MouseArea {
            id: settingsMouseArea
            anchors.fill: parent
            onClicked: pageStack.push(Qt.resolvedUrl("Settings.qml"))
        }
    }

    Rectangle {
        id: quitButton
        width: units.gu(6)
        height: width
        anchors.right: parent.right
        anchors.rightMargin: units.gu(3)
        anchors.top: parent.top
        anchors.topMargin: units.gu(1)
        color: "black"
        radius: width / 2

        Image {
            id: closeIcon
            anchors.fill: parent
            anchors.margins: units.gu(1.5)
            source: "qrc:///images/close-white.png"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: Qt.quit()
        }
    }
}
