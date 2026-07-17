-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContentProvider = v5.ContentProvider;
local Players = v5.Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local VendingMachineAppWrapper = RuntimeLib.import(script, script.Parent, "ui", "vending-machine-app-wrapper").VendingMachineAppWrapper;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "VendingMachineUiController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 27
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "VendingMachineUiController";
    p8.hasPreloaded = false;
end;

function u6.KnitStart(u9) -- Line: 36
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), ContentProvider (copy), SoundManager (copy), GameSound (copy), u3 (copy), BedwarsImageId (copy), u2 (copy), u4 (copy), VendingMachineAppWrapper (copy), Players (copy)
    KnitController.KnitStart(u9);
    WatchCollectionTag("VendingMachine", function(p10) -- Line: 39
        -- upvalues: u9 (copy), ContentProvider (ref), SoundManager (ref), GameSound (ref), u3 (ref), BedwarsImageId (ref)
        if u9.hasPreloaded then
            return nil;
        end;

        u9.hasPreloaded = true;
        ContentProvider:PreloadAsync({ SoundManager:createSound(GameSound.VENDING_ROLL_TICK), SoundManager:createSound(GameSound.VENDING_ROLL_PRIZE), u3("ImageLabel", {
                Image = BedwarsImageId.VENDING_RING
            }) });
    end);
    WatchCollectionTag("VendingMachine", function(p11) -- Line: 48
        -- upvalues: u2 (ref), u4 (ref), VendingMachineAppWrapper (ref), Players (ref)
        local Screen = p11:WaitForChild("Screen");
        local u12 = u2.new();
        Screen.AncestryChanged:Connect(function(p13, p14) -- Line: 51
            -- upvalues: u12 (copy)
            if p14 == nil then
                u12:DoCleaning();
            end;
        end);
        local u15 = u4.mount(u4.createElement("SurfaceGui", {
            ResetOnSpawn = false,
            Adornee = Screen
        }, { u4.createElement(VendingMachineAppWrapper, {
                vendingMachine = p11
            }) }), Players.LocalPlayer:WaitForChild("PlayerGui"), "VendingMachine");
        u12:GiveTask(function() -- Line: 64
            -- upvalues: u4 (ref), u15 (copy)
            u4.unmount(u15);
        end);
    end);
end;

KnitClient.CreateController(u6.new());

return nil;