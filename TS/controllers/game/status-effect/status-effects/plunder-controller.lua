-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "PlunderController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 25
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "PlunderController";
end;

function u3.KnitStart(p6) -- Line: 33
    -- upvalues: KnitController (copy), default (copy), Players (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), ItemUtil (copy), KnitClient2 (copy), getItemMeta (copy)
    KnitController.KnitStart(p6);
    default.Client:OnEvent("PlunderProc", function(p7, p8, p9, p10) -- Line: 35
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), ItemUtil (ref), KnitClient2 (ref), getItemMeta (ref)
        local PrimaryPart = p7.PrimaryPart;

        if not PrimaryPart then
            return nil;
        end;

        local u11 = p7 == Players.LocalPlayer.Character;

        if u11 and not p10 then
            SoundManager:playSound(GameSound.CONFETTI);
        end;

        local u12 = 0;
        local Position = PrimaryPart.Position;
        local v13;

        if p9 == nil then
            v13 = p9;
        else
            v13 = p9.PrimaryPart;
        end;

        if v13 then
            Position = p9.PrimaryPart.Position;
        end;

        Players:GetPlayerFromCharacter(p7);

        for _, v in p8 do
            local v14 = math.min(v.amount, 5);
            local v15 = ReplicatedStorage:WaitForChild("Items"):WaitForChild(v.itemType);
            local u16 = ItemUtil.cloneItemIntoModel(v15);
            local v17 = false;
            local v18 = 0;

            while true do
                if true then
                    if v17 then
                        v18 = v18 + 1;
                    else
                        v17 = true;
                    end;
                end;

                if v18 >= math.ceil(v14) then
                    break;
                end;

                task.spawn(function() -- Line: 70
                    -- upvalues: KnitClient2 (ref), u16 (copy), Position (ref), PrimaryPart (copy), SoundManager (ref), GameSound (ref), u11 (copy), u12 (ref), getItemMeta (ref), v (copy)
                    task.wait(math.random() * 0.2);
                    KnitClient2.Controllers.ReceiveItemEffectController:playEffect(u16, Position, function() -- Line: 72
                        -- upvalues: PrimaryPart (ref)
                        return PrimaryPart.CFrame;
                    end, 0.5 + math.random() * 0.2):andThen(function(p19) -- Line: 75
                        -- upvalues: SoundManager (ref), GameSound (ref), u11 (ref), PrimaryPart (ref), u12 (ref), getItemMeta (ref), v (ref)
                        if p19 then
                            local PICKUP_ITEM_DROP = GameSound.PICKUP_ITEM_DROP;
                            local v20 = {
                                volumeMultiplier = 0.8
                            };
                            local v21;

                            if u11 then
                                v21 = nil;
                            else
                                v21 = PrimaryPart.Position;
                            end;

                            v20.position = v21;
                            local v22 = u12;
                            u12 = u12 + 1;
                            v20.playbackSpeedMultiplier = v22 / 50 + 1;
                            SoundManager:playSound(PICKUP_ITEM_DROP, v20);
                            local pickUpOverlaySound = getItemMeta(v.itemType).pickUpOverlaySound;

                            if pickUpOverlaySound ~= "" and pickUpOverlaySound then
                                local v23 = {
                                    volumeMultiplier = 0.9
                                };
                                local v24;

                                if u11 then
                                    v24 = nil;
                                else
                                    v24 = PrimaryPart.Position;
                                end;

                                v23.position = v24;
                                local v25 = u12;
                                u12 = u12 + 1;
                                v23.playbackSpeedMultiplier = v25 / 50 + 1;
                                SoundManager:playSound(pickUpOverlaySound, v23);
                            end;
                        end;
                    end);
                end);
            end;
        end;
    end);
end;

function u3.attachGlitchEffect(p26, p27) -- Line: 110
    -- upvalues: KnitClient (copy)
    local PrimaryPart = p27.PrimaryPart;

    if PrimaryPart then
        KnitClient.Controllers.GlitchEffectsController:playGlitchExplosion(PrimaryPart.Position, {
            parent = PrimaryPart
        });
    end;
end;

KnitClient.CreateController(u3.new());

return nil;