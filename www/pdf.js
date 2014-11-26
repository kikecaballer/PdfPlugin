var argscheck = require('cordova/argscheck'),
    utils = require('cordova/utils'),
    exec = require('cordova/exec');
   
var PdfPlugin = function() {};

PdfPlugin.create = function(data) {
    exec(null, null, "PdfPlugin", "create", [data]);
};

module.exports = PdfPlugin;