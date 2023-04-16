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
import QtMultimedia 5.4
import Lomiri.Thumbnailer 0.1

import MonsterWars 1.0

MainView {
    id: app
    objectName: "mainView"
    applicationName: "monsterwars.t-mon"
    automaticOrientation: false

    property string green: "#00c500"
    property string blue: "#0083c7"
    property string red: "#c12600"

    width: units.gu(70)
    height: units.gu(40)

    Audio {
        id: musicPlayer
        source: dataDirectory + "sounds/menu-music.ogg"
        volume: 1
        loops: Audio.Infinite
    }

    Connections {
        target: Qt.application
        onActiveChanged: app.updateMusic()
    }

    Connections {
        target: gameEngine
        onGameStoped: {
            musicPlayer.stop()
            musicPlayer.source = dataDirectory + "sounds/menu-music.ogg"
            updateMusic()
        }
        onGamePaused: {
            musicPlayer.volume = musicPlayer.volume / 2
        }
        onGameOver: {
            musicPlayer.stop()
            musicPlayer.source = dataDirectory + "sounds/menu-music.ogg"
            updateMusic()
        }
        onGameContinue: {
            musicPlayer.volume = musicPlayer.volume * 2
        }
        onGameRestarted: {
            musicPlayer.stop()
            musicPlayer.source = dataDirectory + "sounds/gameplay-music.ogg"
            updateMusic()
        }
        onGameStarted: {
            musicPlayer.stop()
            musicPlayer.source = dataDirectory + "sounds/gameplay-music.ogg"
            updateMusic()
        }
    }

    GameEngine {
        id: gameEngine
        dataDir: dataDirectory
        Component.onCompleted: {
            i18n.domain = "monsterwars.t-mon"
            updateMusic()
        }
    }

    function updateMusic() {
        if (gameEngine.playerSettings.muted || !Qt.application.active) {
            musicPlayer.pause()
        } else {
            musicPlayer.play()
        }
    }

    PageStack {
        id: pageStack
        anchors.fill: parent
        Component.onCompleted: push(Qt.resolvedUrl("MainMenu.qml"))
    }
}

