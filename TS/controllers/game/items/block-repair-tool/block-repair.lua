-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out");
local BlockEngine = v1.BlockEngine;
local BreakBlockDamageType = v1.BreakBlockDamageType;
local BlockHealthbar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "break", "block-healthbar").BlockHealthbar;
local BlockHighlighter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "highlight", "block-highlighter").BlockHighlighter;
local BlockSelectorMode = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "select", "block-selector").BlockSelectorMode;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v2.AnimationUtil;
local SoundManager = v2.SoundManager;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v4.ContextActionService;
local Players = v4.Players;
local UserInputService = v4.UserInputService;
local Workspace = v4.Workspace;
local ClientBlockEngine = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "BlockRepair";
    end
});
u5.__index = u5;

function u5.new(...) -- Line: 32
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(u7) -- Line: 36
    -- upvalues: u3 (copy), BlockHealthbar (copy), BlockHighlighter (copy), ClientBlockEngine (copy), BlockSelectorMode (copy)
    u7.maid = u3.new();
    u7.highlightMaid = u3.new();
    u7.cooldown = 0.3;
    u7.blockHealthbar = BlockHealthbar.new(u7.cooldown);
    u7.range = 12;
    u7.lastHitTime = 0;
    u7.blockHighlighter = BlockHighlighter.new(ClientBlockEngine, BlockSelectorMode.SELECT);
    u7.blockHighlighter:setRange(u7.range);
    u7.blockHighlighter:setAllowHighlight(function(p8, p9) -- Line: 45
        -- upvalues: u7 (copy)
        return u7:canHighlight(p8);
    end);
    u7.blockHighlighter:setOnHighlight(function(p10, p11) -- Line: 48
        if not p10 then
            return nil;
        end;
    end);
    u7.blockHighlighter:setOnHighlightEnded(function() -- Line: 53
        -- upvalues: u7 (copy)
        u7.highlightMaid:DoCleaning();
    end);
end;

function u5.canHighlight(p12, p13) -- Line: 57
    -- upvalues: getItemMeta (copy)
    if not p13 then
        return false;
    end;

    local block = getItemMeta(p13.Name).block;

    if not block then
        return false;
    end;

    if block.noRegen then
        return false;
    end;

    return not p13:GetAttribute("NoBreak");
end;

function u5.repairBlock(p14, p15, p16) -- Line: 73
    -- upvalues: Workspace (copy), AnimationUtil (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), getItemMeta (copy), GameSound (copy), BreakBlockDamageType (copy), default (copy), SoundManager (copy), BlockEngine (copy), BlockHealthbar (copy)
    p14.lastHitTime = Workspace:GetServerTimeNow();
    AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.BUILDER_HAMMER_HIT), {
        fadeInTime = 0.02
    });
    local block = getItemMeta(p16.Name).block;

    if block ~= nil then
        block = block.breakType;
    end;

    local FORTIFY_BLOCK = GameSound.FORTIFY_BLOCK;

    if block == BreakBlockDamageType.STONE then
        FORTIFY_BLOCK = GameSound.STONE_BREAK;
    elseif block == BreakBlockDamageType.WOOD then
        FORTIFY_BLOCK = GameSound.WOOD_BREAK;
    elseif block ~= BreakBlockDamageType.DIRT and block == BreakBlockDamageType.WOOL then
        FORTIFY_BLOCK = GameSound.WOOL_BREAK;
    end;

    local v17 = default.Client:Get("RepairBlock"):CallServer({
        blockPosition = p15
    });
    SoundManager:playSound(FORTIFY_BLOCK, {
        position = BlockEngine:getWorldPosition(p15)
    });
    local v18 = BlockEngine:getStore():getBlockData(p15);
    local v19 = BlockHealthbar:getHealthKey(p16);
    local v20 = p16:GetAttribute("MaxHealth");

    if v18 ~= nil then
        v18 = v18:GetAttribute(v19);
    end;

    if v18 == nil then
        v18 = p16:GetAttribute("Health");
    end;

    if v20 == 0 or (v20 ~= v20 or (not v20 or v17 < 0)) then
        return nil;
    end;

    p14.blockHealthbar:show({
        blockPosition = p15,
        blockInstance = p16,
        preHitHealth = v18,
        newHealth = math.min(v18 + v17, v20),
        maxHealth = v20
    });
end;

function u5.enable(u21) -- Line: 130
    -- upvalues: UserInputService (copy), Workspace (copy), ClientBlockEngine (copy), BlockSelectorMode (copy), ContextActionService (copy)
    u21.blockHighlighter:enable();
    u21.maid:GiveTask(function() -- Line: 132
        -- upvalues: u21 (copy)
        u21.blockHighlighter:disable();
    end);
    u21.maid:GiveTask(UserInputService.TouchTapInWorld:Connect(function(p22, p23) -- Line: 136
        -- upvalues: u21 (copy), Workspace (ref), ClientBlockEngine (ref), BlockSelectorMode (ref)
        if p23 then
            return nil;
        end;

        if u21.lastHitTime + u21.cooldown > Workspace:GetServerTimeNow() then
            return nil;
        end;

        local v24 = ClientBlockEngine:getBlockSelector():getMouseInfo(BlockSelectorMode.SELECT, {
            ray = Workspace.CurrentCamera:ViewportPointToRay(p22.X, p22.Y),
            range = u21.range
        });
        local v25;

        if v24 == nil then
            v25 = v24;
        else
            v25 = v24.target;
        end;

        if v25 then
            v25 = u21:canHighlight(v24.target.blockInstance);
        end;

        if v25 then
            u21:repairBlock(v24.target.blockRef.blockPosition, v24.target.blockInstance);
        end;
    end));
    ContextActionService:BindAction("repair-block", function(p26, p27, p28) -- Line: 160
        -- upvalues: u21 (copy), Workspace (ref), ClientBlockEngine (ref), BlockSelectorMode (ref)
        if p27 ~= Enum.UserInputState.Begin then
            return nil;
        end;

        if u21.lastHitTime + u21.cooldown > Workspace:GetServerTimeNow() then
            return nil;
        end;

        local v29 = ClientBlockEngine:getBlockSelector():getMouseInfo(BlockSelectorMode.SELECT, {
            range = u21.range
        });
        local v30;

        if v29 == nil then
            v30 = v29;
        else
            v30 = v29.target;
        end;

        if v30 then
            v30 = u21:canHighlight(v29.target.blockInstance);
        end;

        if v30 then
            u21:repairBlock(v29.target.blockRef.blockPosition, v29.target.blockInstance);
        end;
    end, false, Enum.UserInputType.MouseButton1);
    u21.maid:GiveTask(function() -- Line: 182
        -- upvalues: ContextActionService (ref)
        ContextActionService:UnbindAction("repair-block");
    end);
end;

function u5.disable(p31) -- Line: 186
    p31.maid:DoCleaning();
    p31.blockHealthbar:destroy();
end;

return {
    BlockRepair = u5
};