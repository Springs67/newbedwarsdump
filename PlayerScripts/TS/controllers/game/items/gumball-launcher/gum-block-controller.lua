-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Reflect = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect;
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Controller = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local TeamIdAttr = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").TeamIdAttr;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local GetAttribute = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute;
local StickyBootsClientStatusEffectHandler = RuntimeLib.import(script, script.Parent.Parent.Parent, "status-effect", "handlers", "sticky-boots-client-status-effect-handler").StickyBootsClientStatusEffectHandler;
local u1 = Color3.new(1, 0.4, 0.8);
local u2 = Color3.new(1, 0.35, 0.35);
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "GumBlockController";
    end
});
u3.__index = u3;

function u3.new(...) -- Line: 22
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 26
end;

function u3.onStart(p6) -- Line: 28
    -- upvalues: WatchCollectionTag (copy), GetAttribute (copy), TeamIdAttr (copy), KnitClient (copy), Players (copy), u1 (copy), u2 (copy), StatusEffectType (copy), StickyBootsClientStatusEffectHandler (copy)
    WatchCollectionTag("GumBlock", function(p7) -- Line: 29
        -- upvalues: GetAttribute (ref), TeamIdAttr (ref), KnitClient (ref), Players (ref), u1 (ref), u2 (ref)
        local v8 = GetAttribute(p7, TeamIdAttr);
        local v9 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

        if v9 ~= nil then
            v9 = v9.id;
        end;

        local v10 = v8 == v9;
        local v11;

        if v10 then
            v11 = u1;
        else
            v11 = u2;
        end;

        local Decal = p7:WaitForChild("Part"):WaitForChild("Decal");
        p7:GetRootPart().Color = v11;
        Decal.Texture = v10 and "rbxassetid://14192071543" or "rbxassetid://14192071748";

        if Decal.Parent then
            Decal.Parent.Color = v11;
        end;
    end);
    KnitClient.Controllers.StatusEffectController:setHandler(StatusEffectType.STICKY_BOOTS, StickyBootsClientStatusEffectHandler);
end;

Reflect.defineMetadata(u3, "identifier", "client/controllers/game/items/gumball-launcher/gum-block-controller@GumBlockController");
Reflect.defineMetadata(u3, "flamework:implements", { "$:flamework@OnStart" });
Reflect.decorate(u3, "$:flamework@Controller", Controller, { {} });

return {
    FRIENDLY_BLOCK_COLOR = u1,
    ENEMY_BLOCK_COLOR = u2,
    default = u3
};