-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local SkullDropHud = RuntimeLib.import(script, script.Parent, "skull-drop-hud").SkullDropHud;

return function(p3) -- Line: 9
    -- upvalues: OfflinePlayerUtil (copy), u2 (copy), GameReducer (copy), u1 (copy), StoreProvider (copy), SkullDropHud (copy)
    local v4 = {
        {
            id = "1",
            name = "Red",
            members = {
                [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy
            },
            color = Color3.fromRGB(255, 71, 71)
        },
        {
            id = "2",
            name = "Blue",
            members = {
                [OfflinePlayerUtil.Dummy.Asen.userId] = OfflinePlayerUtil.Dummy.Asen
            },
            color = Color3.fromRGB(66, 46, 255)
        },
        {
            id = "3",
            name = "Green",
            members = {
                [OfflinePlayerUtil.Dummy.spleenhook.userId] = OfflinePlayerUtil.Dummy.spleenhook
            },
            color = Color3.fromRGB(115, 255, 71)
        },
        {
            id = "4",
            name = "Orange",
            members = {
                [OfflinePlayerUtil.Dummy.Bryan3838.userId] = OfflinePlayerUtil.Dummy.Bryan3838
            },
            color = Color3.fromRGB(255, 166, 71)
        }
    };
    local v5 = u2.Store.new(u2.combineReducers({
        Game = GameReducer
    }), {
        Game = {
            teamScores = { {
                    teamId = "1",
                    score = 16
                }, {
                    teamId = "2",
                    score = 24
                }, {
                    teamId = "3",
                    score = 4
                }, {
                    teamId = "4",
                    score = 7
                } },
            teams = v4,
            myTeam = v4[1]
        }
    });
    local u6 = u1.mount(u1.createElement(StoreProvider, {
        store = v5
    }, { u1.createElement(SkullDropHud, {
            AppId = "SkullDropHud"
        }) }), p3);

    return function() -- Line: 67
        -- upvalues: u1 (ref), u6 (copy)
        return u1.unmount(u6);
    end;
end;