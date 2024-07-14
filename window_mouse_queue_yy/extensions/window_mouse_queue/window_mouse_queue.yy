{
    "id": "897059ab-6c2a-4b63-a648-db09480cff45",
    "modelName": "GMExtension",
    "mvc": "1.2",
    "name": "window_mouse_queue",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": true,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 113497714299118,
    "date": "2019-34-12 01:12:29",
    "description": "",
    "exportToGame": true,
    "extensionName": "",
    "files": [
        {
            "id": "bac80d6c-a2e2-445c-9d9d-6141adb131a5",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 9223372036854775807,
            "filename": "window_mouse_queue.dll",
            "final": "",
            "functions": [
                {
                    "id": "3c2c3177-3b35-e03e-351f-cb7f4e249941",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "window_mouse_queue_init_raw",
                    "help": "",
                    "hidden": true,
                    "kind": 11,
                    "name": "window_mouse_queue_init_raw",
                    "returnType": 2
                },
                {
                    "id": "2d3d2066-808e-5b2f-bd97-e95d69f9dd00",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "window_mouse_queue_get_count",
                    "help": "window_mouse_queue_get_count()",
                    "hidden": false,
                    "kind": 1,
                    "name": "window_mouse_queue_get_count",
                    "returnType": 2
                },
                {
                    "id": "159efdbd-30ed-9edf-a354-71255107e497",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "window_mouse_queue_get_data",
                    "help": "",
                    "hidden": true,
                    "kind": 11,
                    "name": "window_mouse_queue_get_data",
                    "returnType": 2
                },
                {
                    "id": "0f1f0244-c4ca-1f0d-9fb5-ad1926604492",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_mouse_queue_get_x",
                    "help": "",
                    "hidden": true,
                    "kind": 11,
                    "name": "window_mouse_queue_get_x",
                    "returnType": 2
                },
                {
                    "id": "51dab99f-10ed-f8bb-ec10-3748ea41824a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_mouse_queue_get_y",
                    "help": "",
                    "hidden": true,
                    "kind": 11,
                    "name": "window_mouse_queue_get_y",
                    "returnType": 2
                },
                {
                    "id": "d3f025f4-7e94-6e18-862f-f1834e2e58b1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_mouse_queue_get_time",
                    "help": "",
                    "hidden": true,
                    "kind": 11,
                    "name": "window_mouse_queue_get_time",
                    "returnType": 2
                },
                {
                    "id": "78687533-0806-d37a-604a-e95d65e84495",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "window_mouse_queue_clear",
                    "help": "window_mouse_queue_clear()",
                    "hidden": false,
                    "kind": 1,
                    "name": "window_mouse_queue_clear",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 1,
            "order": [
                
            ],
            "origname": "extensions\\window_mouse_queue.dll",
            "uncompress": false
        },
        {
            "id": "7cc73678-e3b5-432b-8372-a1d5779ceb4b",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 9223372036854775807,
            "filename": "window_mouse_queue.gml",
            "final": "",
            "functions": [
                {
                    "id": "59e050fc-1016-6bb7-858e-6f5e6a0ef2c0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "window_mouse_queue_init",
                    "help": "",
                    "hidden": true,
                    "kind": 11,
                    "name": "window_mouse_queue_init",
                    "returnType": 2
                },
                {
                    "id": "47f4c555-faba-0c31-40d9-af9fe89a1d70",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_mouse_queue_get",
                    "help": "window_mouse_queue_get(xlist:ds_list<number>, ylist:ds_list<number>, ?timelist:ds_list<number>)->int",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_mouse_queue_get",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 2,
            "order": [
                
            ],
            "origname": "extensions\\gml.gml",
            "uncompress": false
        },
        {
            "id": "962d9a80-fb98-4072-93ea-c79e5ae6f0f4",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": -1,
            "filename": "autogen.gml",
            "final": "",
            "functions": [
                
            ],
            "init": "",
            "kind": 2,
            "order": [
                
            ],
            "origname": "extensions\\autogen.gml",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": true,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosdelegatename": "",
    "iosplistinject": "",
    "license": "Proprietary",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "options": null,
    "optionsFile": "options.json",
    "packageID": "",
    "productID": "",
    "sourcedir": "",
    "supportedTargets": 113497714299118,
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": "",
    "tvosdelegatename": "",
    "tvosmaccompilerflags": "",
    "tvosmaclinkerflags": "",
    "tvosplistinject": "",
    "version": "1.0.0"
}