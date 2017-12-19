/*
Copyright 2017 OCAD University

Licensed under the New BSD license. You may not use this file except in
compliance with this License.

You may obtain a copy of the License at
https://raw.githubusercontent.com/GPII/nexus-dist/master/LICENSE.txt
*/

/* eslint-env node */

"use strict";

var kettle = require("kettle");

require("fluid-authoring");
require("gpii-co-occurrence-engine");
require("./index.js");

kettle.config.loadConfig({
    configName: kettle.config.getConfigName("fluid.visible.nexus.co-occurrence.config"),
    configPath: kettle.config.getConfigPath("%gpii-nexus-dist/configs")
});
