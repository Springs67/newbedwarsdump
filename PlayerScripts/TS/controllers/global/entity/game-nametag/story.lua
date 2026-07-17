-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ServerStorage = v4.ServerStorage;
local Workspace = v4.Workspace;
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local Entity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity").Entity;
local GamePlayerNametag = RuntimeLib.import(script, script.Parent, "game-player-nametag").GamePlayerNametag;

return function(p5) -- Line: 13
    -- upvalues: u1 (copy), u3 (copy), GameReducer (copy), ServerStorage (copy), Workspace (copy), Entity (copy), u2 (copy), StoreProvider (copy), GamePlayerNametag (copy)
    local u6 = u1.new();
    local v7 = u3.Store.new(u3.combineReducers({
        Game = GameReducer
    }), {
        Game = {
            myTeam = nil
        }
    });
    local u8 = ServerStorage.Assets.Villagers:WaitForChild("vesta"):Clone();
    u8.Name = "GameNametagDummy";
    u8.PrimaryPart.Anchored = true;
    u8.Parent = Workspace;
    local v9 = Entity.new(u8);
    v9:hideLobbyDisplayName();
    v9:setHealth(150);
    v9:setBaseMaxHealth(150);
    u6:GiveTask(function() -- Line: 30
        -- upvalues: u8 (copy)
        u8:Destroy();
    end);
    local u10 = u2.mount(u2.createElement(StoreProvider, {
        store = v7
    }, { u2.createElement(GamePlayerNametag, {
            AppId = "GameNametag",
            EntityInstance = u8
        }) }), u8);
    u6:GiveTask(function() -- Line: 41
        -- upvalues: u2 (ref), u10 (copy)
        u2.unmount(u10);
    end);

    return function() -- Line: 44
        -- upvalues: u6 (copy)
        u6:DoCleaning();
    end;
end;