-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local WatchCollectionTag = v1.WatchCollectionTag;
local preloadImages = v1.preloadImages;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local Workspace = v4.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local NewsMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "news", "news-types").NewsMeta;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "NewsController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 27
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "NewsController";
    p7.coverArtsPreloaded = false;
end;

function u5.KnitStart(p8) -- Line: 36
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p8);
    p8:setupNewsNPC();
end;

function u5.setupNewsNPC(u9) -- Line: 40
    -- upvalues: WatchCollectionTag (copy), Workspace (copy), KnitClient2 (copy), Players (copy), BedwarsAppIds (copy)
    WatchCollectionTag("NewsNPC", function(p10) -- Line: 41
        -- upvalues: Workspace (ref), KnitClient2 (ref), Players (ref), u9 (copy), BedwarsAppIds (ref)
        if not p10:IsDescendantOf(Workspace) then
            return nil;
        end;

        KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            RequiresLineOfSight = false,
            MaxActivationDistance = 18,
            HoldDuration = 0,
            ActionText = "Newsman",
            ObjectText = "View News",
            Parent = p10
        }).Triggered:Connect(function(p11) -- Line: 55
            -- upvalues: Players (ref), u9 (ref), BedwarsAppIds (ref)
            if p11 ~= Players.LocalPlayer then
                return nil;
            end;

            u9:preloadCoverArts();
            u9:openNewsUI({
                AppId = BedwarsAppIds.NEWS
            });
        end);
    end);
end;

function u5.openNewsUI(p12, p13) -- Line: 66
    -- upvalues: Flamework (copy), BedwarsAppIds (copy)
    local v14 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
    local NEWS = BedwarsAppIds.NEWS;
    local v15 = {};

    if type(p13) == "table" then
        for i, v in p13 do
            v15[i] = v;
        end;
    end;

    v14:openApp(NEWS, v15);
end;

function u5.preloadCoverArts(p16) -- Line: 77
    -- upvalues: u3 (copy), NewsMeta (copy), preloadImages (copy)
    if p16.coverArtsPreloaded then
        return nil;
    end;

    local v17 = u3.values(NewsMeta);

    local function _(p18) -- Line: 82
        return p18.coverArt;
    end;

    local v19 = table.create(#v17);

    for i, v in v17 do
        local _ = i - 1;
        v19[i] = v.coverArt;
    end;

    preloadImages(v19);
    p16.coverArtsPreloaded = true;
end;

KnitClient.CreateController(u5.new());

return nil;