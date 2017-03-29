var express = require('express');
var router = express.Router();

router.get('/testGET', function(req, res, next) {
    var data = {};
    data.test = "test response";
    data.other = 10;
    res.send(data);
});

module.exports = router;
