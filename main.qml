import QtQuick 2.7
import QtQuick.Window 2.2
import QtQml 2.2
import QtQuick.Controls 2.0


Window {
    visible: true
    width: 640
    height: 480

    ListModel {
            id: listModel
    }

    ListView{
        id: listview

        anchors.margins: 10
        anchors.fill: parent
        model: listModel
        spacing: 10
        delegate: Text {
                    text: listdata ;
        }

    }

    function getData() {
            var request = new XMLHttpRequest();
            var url = "http://cc.sushivesla.by/timings/index.xml";
            request.onreadystatechange = function () {
                if (request.readyState === XMLHttpRequest.DONE) {
                    if (request.status === 200) {
                        console.log(request.responseText)
                        var result = JSON.parse(request.responseText)
                        for (var i in result)
                            var restname;
                            if(result[i].cafe_id){

                            }

                        listModel.append({ listdata: result[i].cafe_id + " " + result[i].takeaway_sushi + " " + result[i].takeaway_wok + " "+ result[i].delivery_near + " "+result[i].delivery_far});

                } else {
                    console.log("HTTP request failed", request.status)
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
