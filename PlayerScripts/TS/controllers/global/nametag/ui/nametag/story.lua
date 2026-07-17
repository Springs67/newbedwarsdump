-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ServerStorage = v2.ServerStorage;
local Workspace = v2.Workspace;
local Entity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity").Entity;
local NameTag = RuntimeLib.import(script, script.Parent, "nametag").NameTag;

return function(p3) -- Line: 9
    -- upvalues: ServerStorage (copy), Workspace (copy), Entity (copy), u1 (copy), NameTag (copy)
    local u4 = ServerStorage.Assets.Villagers:WaitForChild("vesta"):Clone();
    u4.Name = "NametagDummy";
    u4.PrimaryPart.Anchored = true;
    u4.Parent = Workspace;
    local v5 = Entity.new(u4);
    v5:hideLobbyDisplayName();
    v5:setHealth(150);
    v5:setBaseMaxHealth(150);
    local u6 = u1.mount(u1.createElement(NameTag, {
        EntityInstance = u4
    }), u4);

    return function() -- Line: 21
        -- upvalues: u1 (ref), u6 (copy), u4 (copy)
        u1.unmount(u6);
        u4:Destroy();
    end;
end;