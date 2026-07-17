-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConstantManager = v1.ConstantManager;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local InOutQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutQuad;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = ConstantManager.registerConstants(script, {
    P1XRange = NumberRange.new(-30, 30),
    P1YRange = NumberRange.new(-15, 15),
    P1ZRange = NumberRange.new(-15, 15)
});
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "ReceiveItemEffectController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 32
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, ...) -- Line: 36
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6, ...);
    p6.Name = "ReceiveItemEffectController";
    p6.random = Random.new();
end;

function u4.KnitStart(p7) -- Line: 41
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p7);
end;

u4.playEffect = RuntimeLib.async(function(p8, p9, u10, u11, p12, p13) -- Line: 44
    -- upvalues: Workspace (copy), u3 (copy), GameQueryUtil (copy), default (copy), InOutQuad (copy)
    local v14 = Workspace:GetServerTimeNow();

    if p13 == 0 or (p13 ~= p13 or not p13) then
        p13 = v14;
    end;

    local v15 = v14 - p13;
    local v16 = u11();

    if not v16 then
        return false;
    end;

    local Position = (v16 * CFrame.new(p8.random:NextNumber(u3.P1XRange.Min, u3.P1XRange.Max), p8.random:NextNumber(u3.P1YRange.Min, u3.P1YRange.Max), p8.random:NextNumber(u3.P1ZRange.Min, u3.P1ZRange.Max))):Lerp(v16, 0.5).Position;
    local u17 = p9:Clone();

    local function _(p18) -- Line: 58
        -- upvalues: GameQueryUtil (ref)
        return GameQueryUtil:setQueryIgnored(p18, true);
    end;

    for i, descendant in u17:GetDescendants() do
        local _ = i - 1;
        GameQueryUtil:setQueryIgnored(descendant, true);
    end;

    u17.Parent = Workspace;
    default(p12 - v15, InOutQuad, function(p19) -- Line: 65
        -- upvalues: u11 (copy), u10 (copy), Position (copy), u17 (ref)
        local v20 = u11();

        if v20 ~= nil then
            v20 = v20.Position;
        end;

        if not v20 then
            return nil;
        end;

        local v21 = u10:Lerp(Position, p19):Lerp(Position:Lerp(v20, p19), p19);
        u17:PivotTo(CFrame.new(v21) * CFrame.Angles(0, 6.283185307179586 * p19, 0));
    end, v15, 1):Wait();
    u17:Destroy();

    return true;
end);

function u4.playEffectForItems(u22, p23, u24, u25, u26, p27) -- Line: 86
    -- upvalues: ReplicatedStorage (copy), ItemUtil (copy), SoundManager (copy), GameSound (copy), getItemMeta (copy)
    local v28 = p27 == nil and 5 or p27;
    local u29 = 0;

    for _, v in p23 do
        local v30 = math.min(v.amount, v28);

        if v28 < v.amount then
            v30 = v30 + math.log(v.amount - v28 + 1, 2);
        end;

        local v31 = ReplicatedStorage:WaitForChild("Items"):WaitForChild(v.itemType);
        local u32 = ItemUtil.cloneItemIntoModel(v31);
        local v33 = false;
        local v34 = 0;

        while true do
            if true then
                if v33 then
                    v34 = v34 + 1;
                else
                    v33 = true;
                end;
            end;

            if v34 >= math.ceil(v30) then
                break;
            end;

            task.spawn(function() -- Line: 110
                -- upvalues: u22 (copy), u32 (copy), u24 (copy), u25 (copy), SoundManager (ref), GameSound (ref), u26 (copy), u29 (ref), getItemMeta (ref), v (copy)
                task.wait(math.random() * 0.2);
                u22:playEffect(u32, u24, u25, 0.5 + math.random() * 0.2):andThen(function(p35) -- Line: 113
                    -- upvalues: SoundManager (ref), GameSound (ref), u26 (ref), u25 (ref), u29 (ref), getItemMeta (ref), v (ref)
                    if p35 then
                        local PICKUP_ITEM_DROP = GameSound.PICKUP_ITEM_DROP;
                        local v36 = {};
                        local v37;

                        if u26 == "PlayLocally" then
                            v37 = nil;
                        else
                            v37 = u25();

                            if v37 ~= nil then
                                v37 = v37.Position;
                            end;
                        end;

                        v36.position = v37;
                        v36.volumeMultiplier = 0.8;
                        local v38 = u29;
                        u29 = u29 + 1;
                        v36.playbackSpeedMultiplier = v38 / 50 + 1;
                        SoundManager:playSound(PICKUP_ITEM_DROP, v36);
                        local pickUpOverlaySound = getItemMeta(v.itemType).pickUpOverlaySound;

                        if pickUpOverlaySound ~= "" and pickUpOverlaySound then
                            local v39 = {};
                            local v40;

                            if u26 == "PlayLocally" then
                                v40 = nil;
                            else
                                v40 = u25();

                                if v40 ~= nil then
                                    v40 = v40.Position;
                                end;
                            end;

                            v39.position = v40;
                            v39.volumeMultiplier = 0.9;
                            local v41 = u29;
                            u29 = u29 + 1;
                            v39.playbackSpeedMultiplier = v41 / 50 + 1;
                            SoundManager:playSound(pickUpOverlaySound, v39);
                        end;
                    end;
                end);
            end);
        end;
    end;
end;

KnitClient.CreateController(u4.new());

return nil;