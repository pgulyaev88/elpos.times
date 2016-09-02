import QtQuick 2.7
import QtQuick.Window 2.2
import QtQml 2.2
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick 2.0
import QtQuick.Controls.Universal 2.0


Window {
    id: window1
    visible: true
    width: 1920
    height: 1080
    visibility: "FullScreen"

    ListModel {
            id: listModel
    }

    TableView {
        width: 1920
        height: 1080
        scale: 1
        alternatingRowColors: true
        anchors.topMargin: 0
        anchors.fill: parent

        rowDelegate: Rectangle {
            height: 90
            border.color: "#ffffff"
            color: "#000000"

        }
        headerDelegate: Text{
            width: 100
            height: 100
            color: "#000000"
            font.pixelSize : 72
            text: styleData.value
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        TableViewColumn {
            role: "restname"
            title: "Рест"
            width: 500

            delegate: Text {
                    font.pixelSize : 72
                    color: "white"
                    text: styleData.value
                    verticalAlignment: Text.AlignVCenter

                    }
        }
        TableViewColumn {
            role: "takeaway_sushi"
            title: "Суши"
            width: 350
            horizontalAlignment:Text.AlignHCenter
            delegate: Text {
                    font.pixelSize : 72
                    text: styleData.value
                    verticalAlignment: Text.AlignVCenter
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    }
        }
        TableViewColumn {
            role: "takeaway_wok"
            title: "Вок"
            width: 350
            horizontalAlignment:Text.AlignHCenter
            delegate: Text {
                    font.pixelSize : 72
                    text: styleData.value
                    verticalAlignment: Text.AlignVCenter
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    }

        }
        TableViewColumn {
            role: "delivery_near"
            title: "Доставка"
            width: 350
            horizontalAlignment:Text.AlignHCenter
            delegate: Text {
                    font.pixelSize : 72
                    text: styleData.value
                    verticalAlignment: Text.AlignVCenter
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    }
        }
        TableViewColumn {
            role: "delivery_far"
            title: "Дальняя"
            width: 350
            horizontalAlignment:Text.AlignHCenter
            delegate: Text {
                    font.pixelSize : 72
                    text: styleData.value
                    verticalAlignment: Text.AlignVCenter
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
           }

        }

        model: listModel
    }



    function getData() {


            var request = new XMLHttpRequest();
            var url = "http://cc.sushivesla.by/timings/index.xml";
            request.onreadystatechange = function () {
                if (request.readyState === XMLHttpRequest.DONE) {
                    if (request.status === 200) {
//                        console.log(request.responseText);
                        var result = JSON.parse(request.responseText);
            listModel.clear();
                        var restname ;




                        for (var i in result){
                        switch (parseInt(result[i].cafe_id))
                            {
                              case 1006898:
                              restname = "Караван";
                              break;

                              case 1001394:
                              restname = "Скала";
                              break;

                              case 1003275:
                              restname = "Глобо";
                              break;

                              case 1009389:
                              restname = "ЮГ";
                              break;

                              case 1003270:
                              restname = "Машерова";
                              break;

                              case 1003271:
                              restname = "Айсберг";
                              break;

                              case 1003273:
                              restname = "Рокоссовского";
                              break;

                              case 1003272:
                              restname = "Притыцкого";
                              break;

                              case 1003274:
                              restname = "Уручье";
                              break;

                              case 1009802:
                              restname = "Парк";
                              break;
                            }

                        listModel.append({ "restname": restname,"takeaway_sushi": result[i].takeaway_sushi,"takeaway_wok": result[i].takeaway_wok,
                                                "delivery_near":result[i].delivery_near, "delivery_far":result[i].delivery_far});
//                        console.log(result[i].restname);
//                        console.log(result[i].cafe_id);
//                        console.log(result[i].takeaway_sushi)
//                        console.log(result[i].takeaway_wok)
//                        console.log(result[i].delivery_near)
//                        console.log(result[i].delivery_far)

                        }

                } else {
                    console.log("HTTP request failed", request.status);
                    }
                }
        }

        request.open("GET", url);
        request.send();
        console.log(url);

    }

//        Button {
//                anchors.bottom: parent.bottom
//                width: parent.width
//                text: "Get Data"
//                onClicked: getData()
//        }

    Component.onCompleted: {
            getData()
        }

    Timer {
           interval: 10000; running: true; repeat: true
           onTriggered:getData()
       }



}
