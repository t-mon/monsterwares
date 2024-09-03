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
import MonsterWars 1.0
import QtQuick.Layouts 1.1
import Lomiri.Components 1.3
import Lomiri.Thumbnailer 0.1

Page {
    id: root
    head {
        visible: false
        locked: true
    }

    Rectangle {
        id: screenRectangle
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

        Flickable {
            anchors.margins: units.gu(2)
            anchors.top: menuBar.bottom
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            contentHeight: columnLayout.height

            ColumnLayout {
                id: columnLayout
                spacing: units.gu(4)

                Column {
                    spacing: units.gu(1)
                    Text {
                        text: "Monster Wars"
                        font.weight: Font.DemiBold
                        font.bold: true
                        style: Text.Outline
                        styleColor: "steelblue"
                        font.pixelSize: units.gu(9)
                    }

                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: units.gu(2)
                        // TRANSLATORS: The "version" of the application
                        text: i18n.tr("Version:") + " " + version
                        font.weight: Font.DemiBold
                        font.pixelSize: units.gu(3)
                    }
                }

                Column {
                    spacing: units.gu(1)
                    Text {
                        // TRANSLATORS: "Author" section in the "About" view
                        text: i18n.tr("Author")
                        font.weight: Font.DemiBold
                        style: Text.Outline
                        styleColor: "white"
                        font.pixelSize: units.gu(4)
                    }

                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: units.gu(2)
                        text: "Simon Stürz"
                        font.weight: Font.DemiBold
                        font.pixelSize: units.gu(3)
                    }
                }

                Column {
                    spacing: units.gu(1)
                    Text {
                        // TRANSLATORS: Design section in the "About" view
                        text: i18n.tr("Design")
                        font.weight: Font.DemiBold
                        style: Text.Outline
                        styleColor: "white"
                        font.pixelSize: units.gu(4)
                    }

                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: units.gu(2)
                        text: "Simon Stürz"
                        font.weight: Font.DemiBold
                        font.pixelSize: units.gu(3)
                    }
                }

                Column {
                    spacing: units.gu(1)
                    Text {
                        // TRANSLATORS: Source code section in the "About" view
                        text: i18n.tr("Enjoying the game?")
                        font.weight: Font.DemiBold
                        style: Text.Outline
                        styleColor: "white"
                        font.pixelSize: units.gu(4)
                    }


                    Rectangle {
                        id: donateButton
                        height: units.gu(15)
                        width: units.gu(40)

                        color: "transparent"
                        Image {
                            id: donateButtonMonster
                            anchors.fill: parent
                            source: "qrc:///images/donate-button.png"
                        }

                        Text {
                            anchors.centerIn: parent
                            // TRANSLATORS: The "Donate" button in the main menu
                            text: i18n.tr("Donate")
                            font.bold: true
                            font.pixelSize: units.gu(4)
                            color: donateButtonMouseArea.pressed ? "steelblue" : "white"
                        }

                        MouseArea {
                            id: donateButtonMouseArea
                            anchors.fill: parent
                            onClicked: Qt.openUrlExternally("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=ZLY4J8HCNEDE2")
                        }
                    }
                    SequentialAnimation {
                        id: donateButtonAnimation
                        ScaleAnimator {
                            target: donateButton
                            from: 0.99
                            to: 1.03
                            easing.type: Easing.Linear;
                            duration: 1000
                        }
                        ScaleAnimator {
                            target: donateButton
                            from: 1.03
                            to: 0.99
                            easing.type: Easing.Linear;
                            duration: 800
                        }
                        running: true
                        loops: Animation.Infinite
                    }
                }


                Column {
                    spacing: units.gu(1)
                    Text {
                        // TRANSLATORS: Source code section in the "About" view
                        text: i18n.tr("Source code")
                        font.weight: Font.DemiBold
                        style: Text.Outline
                        styleColor: "white"
                        font.pixelSize: units.gu(4)
                    }

                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: units.gu(2)
                        text: "https://github.com/t-mon/monsterwars"
                        font.weight: Font.DemiBold
                        font.underline: true
                        font.pixelSize: units.gu(3)
                        MouseArea {
                            anchors.fill: parent
                            onClicked: Qt.openUrlExternally("https://github.com/t-mon/monsterwars")
                        }
                    }
                }


                Column {
                    spacing: units.gu(1)
                    Text {
                        // TRANSLATORS: License section in the "About" view
                        text: i18n.tr("License")
                        font.weight: Font.DemiBold
                        style: Text.Outline
                        styleColor: "white"
                        font.pixelSize: units.gu(4)
                    }

                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: units.gu(2)
                        text: "GPL v3"
                        font.weight: Font.DemiBold
                        font.underline: true
                        font.pixelSize: units.gu(3)
                        MouseArea {
                            anchors.fill: parent
                            onClicked: Qt.openUrlExternally("https://www.gnu.org/licenses/gpl-3.0.html")
                        }
                    }
                }

                Column {
                    spacing: units.gu(1)
                    Text {
                        // TRANSLATORS: Reference to the background image in the "About" view
                        text: i18n.tr("Backgrounds")
                        font.weight: Font.DemiBold
                        style: Text.Outline
                        styleColor: "white"
                        font.pixelSize: units.gu(4)
                    }

                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: units.gu(2)
                        text: "http://shadowhousecreations.blogspot.de"
                        font.weight: Font.DemiBold
                        font.underline: true
                        font.pixelSize: units.gu(3)
                        MouseArea {
                            anchors.fill: parent
                            onClicked: Qt.openUrlExternally("http://shadowhousecreations.blogspot.de")
                        }
                    }

                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: units.gu(2)
                        // TRANSLATORS: Terms of use for the background image in the "About" view
                        text: i18n.tr("Terms of use")
                        font.weight: Font.DemiBold
                        font.underline: true
                        font.pixelSize: units.gu(3)
                        MouseArea {
                            anchors.fill: parent
                            onClicked: Qt.openUrlExternally("http://shadowhousecreations.blogspot.de/p/terms-of-use.html")
                        }
                    }
                }

                Column {
                    spacing: units.gu(3)
                    Text {
                        // TRANSLATORS: Reference to the music in the "About" view
                        text: i18n.tr("Music")
                        font.weight: Font.DemiBold
                        style: Text.Outline
                        styleColor: "white"
                        font.pixelSize: units.gu(4)
                    }
                    Column {
                        spacing: units.gu(1)
                        Row {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            spacing: units.gu(3)
                            Image {
                                id: ccBySaImage
                                source: "qrc:///images/cc-by-sa.png"
                                height: units.gu(7)
                                fillMode: Image.PreserveAspectFit
                                MouseArea {
                                    id: ccBySaMouseArea
                                    anchors.fill: parent
                                    onClicked: Qt.openUrlExternally("http://creativecommons.org/licenses/by-sa/3.0/")
                                }
                            }

                            Text {
                                anchors.verticalCenter: ccBySaImage.verticalCenter
                                text: "Kaetemi"
                                font.weight: Font.DemiBold
                                font.pixelSize: units.gu(3)
                            }
                        }

                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: units.gu(2)
                            text: "opengameart.org/content/polyverse-title-\nalternative"
                            font.weight: Font.DemiBold
                            font.underline: true
                            font.pixelSize: units.gu(3)
                            MouseArea {
                                anchors.fill: parent
                                onClicked: Qt.openUrlExternally("http://opengameart.org/content/polyverse-title-alternative")
                            }
                        }
                    }
                    Column {
                        spacing: units.gu(1)
                        Row {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            spacing: units.gu(3)
                            Image {
                                id: ccImage
                                source: "qrc:///images/cc0.png"
                                height: units.gu(7)
                                fillMode: Image.PreserveAspectFit
                                MouseArea {
                                    id: ccMouseArea
                                    anchors.fill: parent
                                    onClicked: Qt.openUrlExternally("http://creativecommons.org/publicdomain/zero/1.0/")
                                }
                            }

                            Text {
                                anchors.verticalCenter: ccImage.verticalCenter
                                text: "Homingstar"
                                font.weight: Font.DemiBold
                                font.pixelSize: units.gu(3)
                            }
                        }

                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: units.gu(2)
                            text: "opengameart.org/content/fairy-spring"
                            font.weight: Font.DemiBold
                            font.underline: true
                            font.pixelSize: units.gu(3)
                            MouseArea {
                                anchors.fill: parent
                                onClicked: Qt.openUrlExternally("http://opengameart.org/content/fairy-spring")
                            }
                        }
                    }
                }

                Column {
                    spacing: units.gu(1)
                    Text {
                        // TRANSLATORS: "Author" section in the "About" view
                        text: i18n.tr("Click packaging")
                        font.weight: Font.DemiBold
                        style: Text.Outline
                        styleColor: "white"
                        font.pixelSize: units.gu(4)
                    }

                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: units.gu(2)
                        text: "Jonatan Hatakeyama Zeidler"
                        font.weight: Font.DemiBold
                        font.pixelSize: units.gu(3)
                    }
                }

                Column {
                    spacing: units.gu(1)
                    Text {
                        // TRANSLATORS: Reference to the translations in the "About" view
                        text: i18n.tr("Translations")
                        font.weight: Font.DemiBold
                        style: Text.Outline
                        styleColor: "white"
                        font.pixelSize: units.gu(4)
                    }

                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: units.gu(2)
                        // TRANSLATORS: Thank you very much for helping with the translations!! ;)  (in the "About" view)
                        text: i18n.tr("Thanks to all translators!")
                        font.weight: Font.DemiBold
                        font.underline: true
                        font.pixelSize: units.gu(3)
                        MouseArea {
                            anchors.fill: parent
                            onClicked: Qt.openUrlExternally("https://translations.launchpad.net/monsterwars")
                        }
                    }
                }
            }
        }

        MenuBar {
            id: menuBar
            height: units.gu(4)
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
            }
            menuTitle: i18n.tr("About")
        }
    }
}
