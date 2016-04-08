import QtQuick 2.0


Rectangle {
    id: root

    property bool playerX: true
    property bool set: false
    property bool value: true

    signal clicked

    height: parent.height/3;
    width: parent.width/3;

    Image{
        id: img_x;
        visible: false;
        anchors.horizontalCenter: parent.horizontalCenter;
        height: 100;
        width: 100;
        source: "../img/letter_x.png";
    }
    Image{
        id: img_o;
        visible: false;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.verticalCenter: parent.verticalCenter;
        height: 75;
        width: 75;
        source: "../img/letter_o.png";
    }


    MouseArea{
        anchors.fill: root
        onClicked: {
            if(!set)
            {
                value = playerX;

                if(playerX)
                    img_x.visible = true;
                else
                    img_o.visible = true;

                set = true;

                root.clicked();
            }
        }
    }
}
