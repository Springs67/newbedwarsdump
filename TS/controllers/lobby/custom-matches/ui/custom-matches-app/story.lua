-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local CustomMatchesApp = RuntimeLib.import(script, script.Parent, "custom-matches-app").CustomMatchesApp;

return function(p2) -- Line: 9
    -- upvalues: ClientStore (copy), OfflinePlayerUtil (copy), QueueType (copy), CreateRoduxApp (copy), CustomMatchesApp (copy), u1 (copy)
    ClientStore:dispatch({
        type = "CustomMatchSetMapSaves",
        mapSaves = {
            {
                name = "Aqua 2v2",
                description = "nothing",
                code = "1234ABCD5678",
                published = false,
                copylock = true,
                creator = OfflinePlayerUtil.Dummy.oiogy.userId,
                queueType = QueueType.BEDWARS_TO4,
                dateCreated = os.time(),
                lastUpdated = os.time()
            },
            {
                name = "Maze Map",
                description = "nothing",
                code = "56781234ABCD",
                published = false,
                copylock = true,
                creator = OfflinePlayerUtil.Dummy.oiogy.userId,
                queueType = QueueType.BEDWARS_20v20,
                dateCreated = os.time(),
                lastUpdated = os.time()
            }
        }
    });
    local u5 = CreateRoduxApp("CustomMatchesApp", CustomMatchesApp, {
        OnJoinMatch = print,

        OnCreateMatch = function(p3, p4) -- Line: 36, Name: OnCreateMatch
            print(p3, p4);
            task.wait(2);
        end,

        OnClose = function() -- Line: 40, Name: OnClose
            return print("Close");
        end
    }, {}, {
        Parent = p2
    });

    return function() -- Line: 46
        -- upvalues: u1 (ref), u5 (copy)
        u1.unmount(u5);
    end;
end;