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

Page {
    id: root
    visible: false
    head {
        visible: false
        locked: true
    }

    Rectangle {
        anchors.fill: parent
        color: "black"

        Text {
            id: resetText
            anchors.centerIn: parent
            // TRANSLATORS: Reset warning message. Please insert also the "\n" in the middle of the text!
            text: i18n.tr("Are you sure you want to reset all\ngame settings and achievements?")
            color: "white"
            font.pixelSize: units.gu(4)
        }

        Button {
            id: noButton
            anchors {
                left: resetText.left
                top: resetText.bottom
                topMargin: units.gu(3)
            }
            text: i18n.tr("No")
            gradient: LomiriColors.greyGradient
            onClicked: pageStack.pop()
        }

        Button {
            id: yesButton
            anchors {
                right: resetText.right
                top: resetText.bottom
                topMargin: units.gu(3)
            }
            text: i18n.tr("Reset")
            gradient: LomiriColors.orangeGradient
            onClicked: {
                gameEngine.resetGameSettings()
                pageStack.pop()
            }
        }
    }

}
