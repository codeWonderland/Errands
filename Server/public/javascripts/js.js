
function postRequest(path, data, success) {
    $.ajax({
        type: "POST",
        data: data,
        url: "http://codewonderland.me:6789" + path,
        dataType: "JSON",
        success: function(response) {
            success(response);
        }
    });
}

$(document).ready(function() {
    postRequest("/api/addTask", {
        message: "test",
        author: "test author",
        timeCreated: "testtimecreated",
        uid: "testuid"
    }, function(response) {
        console.log(response);
    });
});