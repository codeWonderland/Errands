
function postRequest(path, data, success) {
    $.ajax({
        type: "POST",
        data: data,
        url: "http://localhost:6789" + path,
        dataType: "JSON",
        success: function(response) {
            success(response);
        }
    });
}

$(document).ready(function() {
    postRequest("/api/addTask", {
        task: {
            message: "test",
            author: "test author",
            timeCreated: "testtimecreated",
            uid: "testuid"
        }
    }, function(response) {
        console.log(response);
    });
});