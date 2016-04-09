// x = first  player
// o = second player

import QtQuick 2.0

Rectangle
{
    property bool game_over: false
    property bool first_player_turn: true

    function check_game_over(player)
    {
        if(!game_over)
        {
            // check if @player won
            if((topLeftCell.value === player && topMidCell.value === player && topRightCell.value === player) || // top row
                    (midLeftCell.value === player && midMidCell.value === player && midRightCell.value === player) || // mid row
                    (bottomLeftCell.value === player && bottomMidCell.value === player && bottomRightCell.value === player) || // bottom row
                    (topLeftCell.value === player && midLeftCell.value === player && bottomLeftCell.value === player) || // left column
                    (topMidCell.value === player && midMidCell.value === player && bottomMidCell.value === player) || // mid column
                    (topRightCell.value === player && midRightCell.value === player && bottomRightCell.value === player) || // right column
                    (topLeftCell.value === player && midMidCell.value === player && bottomRightCell.value === player) || // left diagonal
                    (topRightCell.value === player && midMidCell.value === player && bottomLeftCell.value === player)) // right diagonal
            {
                game_over = true;

                if(player === 1)
                    txt_game_over.text += "Player X Wins!";
                else
                    txt_game_over.text += "Player O Wins!";
            }
            // check for stalemate
            else
            {
                if(topLeftCell.set && topMidCell.set && topRightCell.set &&
                        midLeftCell.set && midMidCell.set && midRightCell.set &&
                        bottomLeftCell.set && bottomMidCell.set && bottomRightCell.set)
                {
                    game_over = true;
                    txt_game_over.text += "Stalemate!";
                }
            }

        }
    }

    function turn_over()
    {
        first_player_turn = !first_player_turn;
        check_game_over(1);
        check_game_over(2);
    }


    id: big_wrapper
    anchors.fill: parent
    border.color: "white"

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
            playerX: first_player_turn
            paused: game_over
            onClicked: turn_over()
        }

        Cell{
            id: topMidCell
            border.color: "red"
            playerX: first_player_turn
            paused: game_over
            onClicked: turn_over()
        }

        Cell{
            id: topRightCell
            border.color: "white"
            playerX: first_player_turn
            paused: game_over
            onClicked: turn_over()
        }

        Cell{
            id: midLeftCell
            border.color: "magenta"
            playerX: first_player_turn
            paused: game_over
            onClicked: turn_over()
        }

        Cell{
            id: midMidCell
            border.color: "gold"
            playerX: first_player_turn
            paused: game_over
            onClicked: turn_over()
        }

        Cell{
            id: midRightCell
            border.color: "green"
            playerX: first_player_turn
            paused: game_over
            onClicked: turn_over()
        }

        Cell{
            id: bottomLeftCell
            border.color: "white"
            playerX: first_player_turn
            paused: game_over
            onClicked: turn_over()
        }

        Cell{
            id: bottomMidCell
            border.color: "brown"
            playerX: first_player_turn
            paused: game_over
            onClicked: turn_over()
        }

        Cell{
            id: bottomRightCell
            border.color: "white"
            playerX: first_player_turn
            paused: game_over
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



    Text
    {
        id: txt_game_over
        visible: game_over
        text: "Game Over: "
        color: "Red"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 28
        font.bold: true
        style: Text.Raised
    }
}
