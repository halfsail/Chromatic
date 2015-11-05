import QtQuick 2.4

ListModel {
    id: model
    signal loadCompleted()
    property string source  // FIXME: this annoyingly has to be relative to THIS component's location
    onSourceChanged: {
        var xhr = new XMLHttpRequest;
        xhr.open("GET", source);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                var a = JSON.parse(xhr.responseText);
                for (var b in a) {
                    model.append(a[b]);
                }
                model.loadCompleted()
            }
        }
        xhr.send();
    }

}
