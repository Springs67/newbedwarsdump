-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local CollectionTagAdded = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "SocialConnectionsNPCController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 24
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "SocialConnectionsNPCController";
end;

function u3.KnitStart(p6) -- Line: 32
    -- upvalues: CollectionTagAdded (copy), KnitClient2 (copy), Players (copy), Flamework (copy), BedwarsAppIds (copy), ColorUtil (copy), CollectionService (copy)
    CollectionTagAdded("VerifyNPC", function(p7) -- Line: 33
        -- upvalues: KnitClient2 (ref), Players (ref), Flamework (ref), BedwarsAppIds (ref), ColorUtil (ref), CollectionService (ref)
        KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ActionText = "Verify Account",
            HoldDuration = 0,
            RequiresLineOfSight = false,
            MaxActivationDistance = 14,
            Parent = p7
        }).Triggered:Connect(function(p8) -- Line: 41
            -- upvalues: Players (ref), Flamework (ref), BedwarsAppIds (ref)
            if p8 == Players.LocalPlayer then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.SOCIAL_CONNECTIONS, {});
            end;
        end);
        local PrimaryPart = p7.PrimaryPart;
        PrimaryPart:SetAttribute("BillboardTitle", "<font color=\"" .. ColorUtil.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\">Verify Account</font>");
        PrimaryPart:SetAttribute("BillboardSize", UDim2.fromScale(6.5, 1.3));
        PrimaryPart:SetAttribute("BillboardStudsOffset", Vector3.new(0, 4, 0));
        CollectionService:AddTag(PrimaryPart, "Billboard");
    end);
end;

KnitClient.CreateController(u3.new());

return nil;