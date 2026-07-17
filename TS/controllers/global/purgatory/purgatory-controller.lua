-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "PurgatoryController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 17
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 21
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "PurgatoryController";
end;

function u1.KnitStart(p4) -- Line: 25
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), EntityUtil (copy), KnitClient (copy)
    KnitController.KnitStart(p4);
    WatchCollectionTag("entity", function(u5) -- Line: 27
        -- upvalues: EntityUtil (ref), KnitClient (ref)
        local u6 = {
            transparency = 1
        };
        u5:GetAttributeChangedSignal("IsInPurgatory"):Connect(function() -- Line: 32
            -- upvalues: EntityUtil (ref), u5 (copy), KnitClient (ref), u6 (copy)
            debug.profilebegin("purgatory-toggle");
            local v7 = EntityUtil:getEntity(u5);

            if u5:GetAttribute("IsInPurgatory") == true then
                KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(u5):addModifier(u6);

                if v7 ~= nil then
                    v7:hideNametag();
                end;
            else
                KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(u5):removeModifier(u6);

                if v7 ~= nil then
                    v7:showNametag();
                end;
            end;

            debug.profileend();
        end);
    end);
end;

KnitClient.CreateController(u1.new());

return nil;