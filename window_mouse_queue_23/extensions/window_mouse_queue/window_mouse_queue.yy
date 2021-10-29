{
  "optionsFile": "options.json",
  "options": [],
  "exportToGame": true,
  "supportedTargets": 113497714299118,
  "extensionVersion": "1.0.0",
  "packageId": "",
  "productId": "",
  "author": "",
  "date": "2019-12-12T01:34:29",
  "license": "Proprietary",
  "description": "",
  "helpfile": "",
  "iosProps": true,
  "tvosProps": false,
  "androidProps": true,
  "installdir": "",
  "files": [
    {"filename":"window_mouse_queue.dll","origname":"extensions\\window_mouse_queue.dll","init":"","final":"","kind":1,"uncompress":false,"functions":[
        {"externalName":"window_mouse_queue_init_raw","kind":11,"help":"","hidden":true,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"window_mouse_queue_init_raw","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_mouse_queue_get_1","kind":11,"help":"","hidden":true,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"window_mouse_queue_get_1","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_mouse_queue_get_2","kind":11,"help":"","hidden":true,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"window_mouse_queue_get_2","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_mouse_queue_clear","kind":1,"help":"window_mouse_queue_clear()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"window_mouse_queue_clear","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[
        
      ],"ProxyFiles":[
        {"name":"window_mouse_queue_x64.dll","tags":[],"resourceVersion":"1.0","resourceType":"GMProxyFile","TargetMask":6,},
      ],"copyToTargets":9223372036854775807,"order":[
        {"name":"window_mouse_queue_init_raw","path":"extensions/window_mouse_queue/window_mouse_queue.yy",},
        {"name":"window_mouse_queue_get_1","path":"extensions/window_mouse_queue/window_mouse_queue.yy",},
        {"name":"window_mouse_queue_get_2","path":"extensions/window_mouse_queue/window_mouse_queue.yy",},
        {"name":"window_mouse_queue_clear","path":"extensions/window_mouse_queue/window_mouse_queue.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
    {"filename":"window_mouse_queue.gml","origname":"extensions\\gml.gml","init":"","final":"","kind":2,"uncompress":false,"functions":[
        {"externalName":"window_mouse_queue_init","kind":11,"help":"","hidden":true,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"window_mouse_queue_init","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_mouse_queue_get","kind":2,"help":"window_mouse_queue_get(xlist:ds_list<number>, ylist:ds_list<number>)->int","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"window_mouse_queue_get","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[
        
      ],"ProxyFiles":[],"copyToTargets":9223372036854775807,"order":[
        {"name":"window_mouse_queue_init","path":"extensions/window_mouse_queue/window_mouse_queue.yy",},
        {"name":"window_mouse_queue_get","path":"extensions/window_mouse_queue/window_mouse_queue.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
    {"filename":"autogen.gml","origname":"extensions\\autogen.gml","init":"","final":"","kind":2,"uncompress":false,"functions":[
        
      ],"constants":[
        
      ],"ProxyFiles":[],"copyToTargets":-1,"order":[
        
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
  ],
  "classname": "",
  "tvosclassname": "",
  "tvosdelegatename": "",
  "iosdelegatename": "",
  "androidclassname": "",
  "sourcedir": "",
  "androidsourcedir": "",
  "macsourcedir": "",
  "maccompilerflags": "",
  "tvosmaccompilerflags": "",
  "maclinkerflags": "",
  "tvosmaclinkerflags": "",
  "androidcodeinjection": "",
  "ioscodeinjection": "",
  "tvoscodeinjection": "",
  "iosSystemFrameworkEntries": [],
  "tvosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
  "IncludedResources": [],
  "androidPermissions": [],
  "copyToTargets": 113497714299118,
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
  "resourceVersion": "1.2",
  "name": "window_mouse_queue",
  "tags": [],
  "resourceType": "GMExtension",
}