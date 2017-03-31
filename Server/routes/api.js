var express = require('express');
var TaskManager = require('../model/TaskManager');

var router = express.Router();

var taskManager = new TaskManager();

router.get('/testGET', function(req, res, next) {
    var data = {};
    data.test = "test response";
    data.other = 10;
    res.send(data);
});

router.get('/tasks', function(req, res, next) {
    res.send(taskManager.getTasks());
});

router.post('/addTask', function(req, res, next) {
    var task = req.body.task;
    if (task.uid != undefined) { // assume task is valid
        taskManager.addTask(task);
    }
    res.send("OK");
});

router.post('/deleteTask', function(req, res, next) {
    var uid = req.body.uid;
    if (uid != undefined) {
        taskManager.deleteTask(uid);
    }
    res.send("OK");
});

module.exports = router;
