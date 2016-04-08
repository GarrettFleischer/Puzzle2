// x = first  player
// o = second player

import QtQuick 2.0

Rectangle
{
    property bool game_over: false
    property bool playerX: true

    function check_game_over()
    {

    }

    function turn_over()
    {
        playerX = !playerX;
        check_game_over();
    }


    id: big_wrapper
    anchors.fill: parent
    border.color: "white"

    Text
    {
        id: txt_game_over
        visible: false
        font.family: "Arial"
        font.pointSize: 72
        color: "Red"
        text: "Game Over"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Grid
    {
        id: grd_board
        height: parent.height * .75
        width: parent.width * .75
        anchors.horizontalCenter: big_wrapper.horizontalCenter
        anchors.verticalCenter: big_wrapper.verticalCenter
        columns: 3
        rows: 3


        Cell{
            id: topLeftCell
            border.color: "white"
            playerX: playerX
            onClicked: turn_over()
        }

        Cell{
            id: topMidCell
            border.color: "red"
            playerX: playerX
            onClicked: turn_over()
        }

        Cell{
            id: topRightCell
            border.color: "white"
            playerX: playerX
            onClicked: turn_over()
        }

        Cell{
            id: midLeftCell
            border.color: "magenta"
            playerX: playerX
            onClicked: turn_over()
        }

        Cell{
            id: midMidCell
            border.color: "gold"
            playerX: playerX
            onClicked: turn_over()
        }

        Cell{
            id: midRightCell
            border.color: "green"
            playerX: playerX
            onClicked: turn_over()
        }

        Cell{
            id: bottomLeftCell
            border.color: "white"
            playerX: playerX
            onClicked: turn_over()
        }

        Cell{
            id: bottomMidCell
            border.color: "brown"
            playerX: playerX
            onClicked: turn_over()
        }

        Cell{
            id: bottomRightCell
            border.color: "white"
            playerX: playerX
            onClicked: turn_over()
        }
    }


    // Hide outer edges...
    Rectangle
    {
        id: rect_left
        anchors.right: grd_board.left
        anchors.rightMargin: -10
        height: grd_board.height
        width: grd_board.width

        border.color: "white"
        border.width: 20
    }

    Rectangle
    {
        id: rect_right
        anchors.left: grd_board.right
        anchors.leftMargin: -10
        height: grd_board.height
        width: grd_board.width

        border.color: "white"
        border.width: 20
    }

    Rectangle
    {
        id: rect_top
        anchors.bottom: grd_board.top
        anchors.bottomMargin: -10
        height: grd_board.height
        width: grd_board.width

        border.color: "white"
        border.width: 20
    }

    Rectangle
    {
        id: rect_bottom
        anchors.top: grd_board.bottom
        anchors.topMargin: -10
        height: grd_board.height
        width: grd_board.width

        border.color: "white"
        border.width: 20
    }
}
