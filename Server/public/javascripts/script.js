/**
 * Created by aliceeaster on 11/22/16.
 */
var HOST = "";

$(document).ready(function() {
    refresh();
});

function errandsFeed(feed, testStatus, jqXHR) {
    console.log(feed);
    var feedDiv = document.getElementById("feed");
    var feedHTML = "";
    //creating individual div elements for each item in feed
    for(var i = feed.length - 1; i > -1; i--) {
        feedHTML +=
            '<br/>' +
            '<div class="feedItem">' +
                '<br/><br/>' +
                '<h5>' + feed[i].author + '</h5>' +
                '<br/>' +
                '<h1>' + feed[i].message + '</h1>' +
                '<br/>' +
                '<h5>' + feed[i].timeCreated + '</h5>' +
                '<br/>' +
                '<button class="btn btn-success" onclick="deleteTask(\'' + feed[i].uid + '\')">Complete!</button>' +
            '</div>';
    }
    feedDiv.innerHTML = feedHTML;

    console.log(feed);
}

//Determines whether or not user has username and if not prompts for one
function processMessage() {
    //localStorage stuff was learned from the textbook
    while(localStorage.getItem("user") == null) {
        localStorage.setItem("user" , prompt("Please provide a username: ", null));
    }
    //calls send_message function with username and message
    var message = document.getElementById("message").value;
    var client = localStorage.getItem("user");
    addTask(message, client);
    document.getElementById("message").value = "";
}

function clearName() {
    localStorage.clear();
    localStorage.setItem("user" , prompt("Please provide a username: ", null));
}

function search() {
    if(event.keyCode == 13) {
        processMessage();
    }
}

function refresh(){
    getRequest("/api/tasks", function(response){
        errandsFeed(response);
    });
}

function postRequest(path, data, success) {
    $.ajax({
        type: "POST",
        data: data,
        url: HOST + path,
        dataType: "JSON",
        success: function(response) {
            success(response);
        }
    });
}

function getRequest(path, success) {
    $.ajax({
        type: "GET",
        url: HOST + path,
        success: function(response) {
            success(response);
        }
    });
}

function deleteTask(id)
{
    var uid = {uid : id};
    $.ajax({
        type: "POST",
        data: uid,
        url: HOST + '/api/deleteTask',
        dataType: "JSON",
        success: function(resonse) {
            success(response);
        }
    });
    location.reload();
    refresh();
}

function addTask(message, client)
{
    var d = new Date();
    var timeStr = "";

    timeStr += d.getHours() + ":" + d.getMinutes() + " " + d.getMonth() + "/" + d.getDay() + "/" + d.getYear();

    postRequest("/api/addTask", {
            message : message,
            author : client,
            timeCreated : timeStr,
            uid : guid()
        }, function(response) {
            console.log("Success");
        }
    ),
        refresh();
}

function guid() {
    function s4() {
        return Math.floor((1 + Math.random()) * 0x10000)
            .toString(16)
            .substring(1);
    }
    return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
        s4() + '-' + s4() + s4() + s4();
}