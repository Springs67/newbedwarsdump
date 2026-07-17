-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InExpo = v2.InExpo;
local Linear = v2.Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local ArmorSlot = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "VoidKnightKillEffect";
    end,

    __index = KillEffect
});
u6.__index = u6;

function u6.new(...) -- Line: 33
    -- upvalues: u6 (copy)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, p9) -- Line: 37
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p8, p9);
    KillEffect.setPlayDefaultKillEffect(p8, false);
end;

function u6.onKill(p10, p11, p12, p13) -- Line: 41
    -- upvalues: u3 (copy), Workspace (copy), KillEffect (copy), GameQueryUtil (copy), EntityUtil (copy), ArmorSlot (copy), getItemMeta (copy), KnitClient (copy), BedwarsKit (copy), RandomUtil (copy), SoundManager (copy), GameSound (copy), default (copy), InExpo (copy), TweenService (copy), u4 (copy), Linear (copy)
    local u14 = u3.new();
    p12.Archivable = true;
    local u15 = p12:Clone();
    u15:PivotTo(p13);
    u15.Parent = Workspace;
    u15.HumanoidRootPart.Anchored = false;
    KillEffect.hideCharacter(p10, p12);
    u14:GiveTask(u15);
    u15:BreakJoints();

    for _, descendant in u15:GetDescendants() do
        if descendant:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(descendant, false);
        end;
    end;

    local u16 = EntityUtil:getEntity(p10.killerPlayer);
    local v17;

    if u16 == nil then
        v17 = u16;
    else
        v17 = u16:getHandItemInstanceFromCharacter();
    end;

    local v18;

    if u16 == nil then
        v18 = u16;
    else
        v18 = u16:getItemsFromArmorSlot(ArmorSlot.HELMET);
    end;

    local v19 = v18 == nil and {} or v18;
    local v20;

    if u16 == nil then
        v20 = u16;
    else
        v20 = u16:getItemsFromArmorSlot(ArmorSlot.CHESTPLATE);
    end;

    local v21 = v20 == nil and {} or v20;
    local v22;

    if u16 == nil then
        v22 = u16;
    else
        v22 = u16:getItemsFromArmorSlot(ArmorSlot.BOOTS);
    end;

    local v23 = v22 == nil and {} or v22;
    local v24;

    if v17 then
        v24 = getItemMeta(v17.Name).sword ~= nil;
    else
        v24 = v17;
    end;

    local v25 = nil;
    local v26 = {};
    local v27 = #v26;
    local v28 = #v19;
    table.move(v19, 1, v28, v27 + 1, v26);
    local v29 = v27 + v28;
    local v30 = #v21;
    table.move(v21, 1, v30, v29 + 1, v26);
    table.move(v23, 1, #v23, v29 + v30 + 1, v26);

    if v24 then
        table.insert(v26, v17);
    end;

    if KnitClient.Controllers.KitController:isUsingKit(p10.killerPlayer, BedwarsKit.VOID_KNIGHT) then
        local v31 = p10.killerPlayer:GetAttribute("VoidKnightTier");
        local v32 = v31 == nil and 0 or v31;
        local Character = p10.killerPlayer.Character;

        if Character ~= nil then
            Character = Character:WaitForChild("3DClothing", 1);
        end;

        if Character then
            local v33 = Character:FindFirstChild("Tier" .. tostring(v32 + 1) .. "Clothing");

            if Character then
                local u34 = {};

                if v33 ~= nil then
                    local function _(p35) -- Line: 125
                        -- upvalues: u34 (copy)
                        if p35:IsA("MeshPart") then
                            table.insert(u34, p35);
                        end;
                    end;

                    for i, child in v33:GetChildren() do
                        local _ = i - 1;

                        if child:IsA("MeshPart") then
                            table.insert(u34, child);
                        end;
                    end;
                end;

                v25 = RandomUtil.fromList(unpack(u34));
            end;
        end;
    end;

    if v25 or #v26 ~= 0 then
        local v36 = v25 or RandomUtil.fromList(unpack(v26)):WaitForChild("Handle", 3);

        if v36 then
            u16 = v36;
        elseif u16 ~= nil then
            u16 = u16:getInstance().PrimaryPart;
        end;
    elseif u16 ~= nil then
        u16 = u16:getInstance().PrimaryPart;
    end;

    if not u16 then
        return u14;
    end;

    SoundManager:playSound(GameSound.VOID_KNIGHT_KILL_EFFECT, {
        volumeMultiplier = 2,
        position = p13.Position
    });

    local function _(u37) -- Line: 165
        -- upvalues: default (ref), InExpo (ref)
        if u37:IsA("MeshPart") then
            local Color = u37.Color;
            default(1, InExpo, function(p38) -- Line: 168
                -- upvalues: u37 (copy), Color (copy)
                u37.Color = Color:Lerp(Color3.fromRGB(94, 0, 107), p38);
                u37.Transparency = p38 / 2;
            end);
        end;
    end;

    for i, child in u15:GetChildren() do
        local _ = i - 1;

        if child:IsA("MeshPart") then
            local Color = child.Color;
            default(1, InExpo, function(p39) -- Line: 168
                -- upvalues: child (copy), Color (copy)
                child.Color = Color:Lerp(Color3.fromRGB(94, 0, 107), p39);
                child.Transparency = p39 / 2;
            end);
        end;
    end;

    task.delay(1, function() -- Line: 177
        -- upvalues: u15 (copy), u16 (ref), Workspace (ref), TweenService (ref)
        local Nametag = u15:WaitForChild("Head"):WaitForChild("Nametag");

        if Nametag ~= nil then
            Nametag:Destroy();
        end;

        u15:BreakJoints();
        local v40 = u15:GetChildren();

        local function v48(u41) -- Line: 184
            -- upvalues: u16 (ref), Workspace (ref), TweenService (ref)
            if u41:IsA("MeshPart") then
                local Size = u41.Size;
                local u42 = nil;
                u41.Anchored = true;
                task.spawn(function() -- Line: 190
                    -- upvalues: u16 (ref), Workspace (ref), u42 (ref), TweenService (ref), u41 (copy), Size (copy)
                    local v43 = false;
                    local v44 = 0;

                    while true do
                        if v43 then
                            v44 = v44 + 1;
                        else
                            v43 = true;
                        end;

                        if v44 >= 3 or not (u16 and u16:IsDescendantOf(Workspace)) then
                            return;
                        end;

                        local v45 = u42;

                        if v45 ~= nil then
                            v45:Destroy();
                        end;

                        u42 = TweenService:Create(u41, TweenInfo.new(0.75), {
                            Size = Size * 0.5,
                            CFrame = u16.CFrame
                        });
                        u42:Play();
                        task.wait(0.3);
                    end;
                end);
                task.delay(0.9, function() -- Line: 219
                    -- upvalues: u16 (ref), Workspace (ref), u41 (copy), u42 (ref), TweenService (ref)
                    local v46 = u16 and u16:IsDescendantOf(Workspace) and (u16.Position - u41.Position).Magnitude > 3;

                    if v46 then
                        local v47 = u42;

                        if v47 ~= nil then
                            v47:Destroy();
                        end;

                        TweenService:Create(u41, TweenInfo.new(0.3), {
                            CFrame = u16.CFrame
                        }):Play();
                    end;
                end);
            end;
        end;

        for i, v in v40 do
            v48(v, i - 1, v40);
        end;
    end);
    task.delay(2, function() -- Line: 242
        -- upvalues: u15 (copy), u16 (ref), Workspace (ref), u14 (copy), SoundManager (ref), GameSound (ref), u4 (ref), default (ref), Linear (ref)
        u15:Destroy();
        local u49 = {};

        if not (u16 and u16:IsDescendantOf(Workspace)) then
            return u14;
        end;

        SoundManager:playSound(GameSound.VOID_KNIGHT_CONSUME, {
            position = u16.Position
        });
        local v50 = u4("Highlight", {
            Name = "handleHighlight",
            FillTransparency = 1,
            OutlineTransparency = 1,
            Parent = u16,
            FillColor = Color3.fromRGB(173, 33, 255),
            DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        });
        table.insert(u49, v50);
        u14:GiveTask(v50);
        local v51 = u16:GetChildren();

        local function v54(p52) -- Line: 262
            -- upvalues: u4 (ref), u49 (copy), u14 (ref)
            if p52:IsA("MeshPart") then
                local v53 = u4("Highlight", {
                    Name = "highlight",
                    FillTransparency = 1,
                    OutlineTransparency = 1,
                    Parent = p52,
                    FillColor = Color3.fromRGB(173, 33, 255),
                    DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                });
                table.insert(u49, v53);
                u14:GiveTask(v53);
            end;
        end;

        for i, v in v51 do
            v54(v, i - 1, v51);
        end;

        default(1, Linear, function(u55) -- Line: 279
            -- upvalues: u49 (copy)
            local function _(p56) -- Line: 280
                -- upvalues: u55 (copy)
                p56.FillTransparency = math.abs(u55) + 0.5;
            end;

            for i, v in u49 do
                local _ = i - 1;
                v.FillTransparency = math.abs(u55) + 0.5;
            end;
        end, 0.5, -0.5);
    end);

    return u14;
end;

return u6;