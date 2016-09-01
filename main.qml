import QtQuick 2.7
import QtQuick.Window 2.2
import QtQml 2.2
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtQuick 2.0


Window {
    id: window1
    visible: true
    width: 1366
    height: 768

    ListModel {
            id: listModel
    }

    ListView{
        id: listview
        width: 500
        height: 350
        model: listModel
        anchors.top: parent.top
        anchors.bottom: buttonBar.top
        delegate: Row{
            Rectangle{
                x: 0
                Text { text: restname; font.pixelSize: 18 }
            }

            Rectangle{
                x:200
                Text { text: takeaway_sushi; font.pixelSize: 18 }
            }
            Rectangle{
                x:400
                Text { text: takeaway_wok; font.pixelSize: 18 }
            }
            Rectangle{
                x:800
                Text { text: delivery_near; font.pixelSize: 18 }
            }
            Rectangle{
                x:1000
                Text { text: delivery_far; font.pixelSize: 18 }
            }
        }
        section.property: "size"
        section.criteria: ViewSection.FullString
        section.delegate: sectionHeading
    }
    Row {
           id: buttonBar
           anchors.bottom: parent.bottom
           anchors.bottomMargin: 1
           spacing: 1

    }
    Component {
           id: sectionHeading
           Rectangle {
               width: container.width
               height: childrenRect.height
               color: "lightsteelblue"

               Text {
                   text: section
                   font.bold: true
                   font.pixelSize: 20
               }
           }
       }

//    TableView {
//        width: 1920
//        height: 1080
//        scale: 1
//        anchors.topMargin: 0
//        anchors.fill: parent

//        TableViewColumn {
//            role: "restname"
//            title: "Ресторан"
//            width: 200

//        }
//        TableViewColumn {
//            role: "takeaway_sushi"
//            title: "Время суши"
//            width: 100
//            horizontalAlignment:Text.AlignHCenter
//        }
//        TableViewColumn {
//            role: "takeaway_wok"
//            title: "Время вок"
//            width: 100
//            horizontalAlignment:Text.AlignHCenter
//        }
//        TableViewColumn {
//            role: "delivery_near"
//            title: "Время доставки"
//            width: 100
//            horizontalAlignment:Text.AlignHCenter
//        }
//        TableViewColumn {
//            role: "delivery_far"
//            title: "Время дальняя"
//            width: 100
//            horizontalAlignment:Text.AlignHCenter
//        }

//        model: listModel
//    }



    function getData() {

            listModel.clear();
            var request = new XMLHttpRequest();
            var url = "http://cc.sushivesla.by/timings/index.xml";
            request.onreadystatechange = function () {
                if (request.readyState === XMLHttpRequest.DONE) {
                    if (request.status === 200) {
//                        console.log(request.responseText);
                        var result = JSON.parse(request.responseText);

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

        Button {
                anchors.bottom: parent.bottom
                width: parent.width
                text: "Get Data"
                onClicked: getData()
        }


}

/*{"1001394":{"id":"6489","cafe_id":"1001394","takeaway_sushi":"15","takeaway_wok":"5","delivery_near":"30","delivery_far":"0","updated_at":"1472133278"},
"1006898":{"id":"6629","cafe_id":"1006898","takeaway_sushi":"15","takeaway_wok":"5","delivery_near":"30","delivery_far":"0","updated_at":"1472474346"},
"1003275":{"id":"6650","cafe_id":"1003275","takeaway_sushi":"0","takeaway_wok":"0","delivery_near":"0","delivery_far":"0","updated_at":"1472501063"},"1003270":{"id":"6718","cafe_id":"1003270","takeaway_sushi":"15","takeaway_wok":"5","delivery_near":"30","delivery_far":"60","updated_at":"1472644659"},"1003273":{"id":"6739","cafe_id":"1003273","takeaway_sushi":"15","takeaway_wok":"5","delivery_near":"0","delivery_far":"0","updated_at":"1472672203"},"1009802":{"id":"6743","cafe_id":"1009802","takeaway_sushi":"30","takeaway_wok":"5","delivery_near":"50","delivery_far":"0","updated_at":"1472718500"},"1009389":{"id":"6744","cafe_id":"1009389","takeaway_sushi":"15","takeaway_wok":"5","delivery_near":"30","delivery_far":"0","updated_at":"1472722348"},"1003272":{"id":"6745","cafe_id":"1003272","takeaway_sushi":"15","takeaway_wok":"5","delivery_near":"40","delivery_far":"60","updated_at":"1472723823"},"1003274":{"id":"6746","cafe_id":"1003274","takeaway_sushi":"15","takeaway_wok":"5","delivery_near":"40","delivery_far":"70","updated_at":"1472724579"},"1003271":{"id":"6748","cafe_id":"1003271","takeaway_sushi":"25","takeaway_wok":"35","delivery_near":"45","delivery_far":"75","updated_at":"1472724955"}}
  */
