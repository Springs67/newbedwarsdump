-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local TweenService = v5.TweenService;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local ShieldType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shield", "shield-type").ShieldType;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local Shield = RuntimeLib.import(script, script.Parent, "shield").Shield;
local v6 = u4.Component:extend("HotbarHealthbar");

function v6.init(p7, p8) -- Line: 22
    -- upvalues: u4 (copy), u3 (copy)
    p7.progressFrame = u4.createRef();
    p7.maid = u3.new();
    p7.characterMaid = u3.new();
    p7:setState({
        health = 100,
        shield = 0
    });
end;

function v6.didMount(u9) -- Line: 31
    -- upvalues: Players (copy)
    if Players.LocalPlayer then
        u9.characterMaid:GiveTask(Players.LocalPlayer.CharacterAdded:Connect(function(p10) -- Line: 33
            -- upvalues: u9 (copy)
            u9:hookCharacter(p10);
        end));

        if Players.LocalPlayer.Character then
            u9:hookCharacter(Players.LocalPlayer.Character);
        end;
    end;
end;

function v6.hookCharacter(u11, u12) -- Line: 41
    -- upvalues: KnitClient (copy), QueueType (copy), TweenService (copy), EntityUtil (copy), u2 (copy), ShieldType (copy)
    u11.maid:DoCleaning();
    local u13;

    if KnitClient.Controllers.MatchController:getQueueType() == QueueType.SUMMER_WARS then
        u11.overrideBarColor = Color3.fromRGB(4, 74, 209);
        u13 = true;
    else
        u13 = false;
    end;

    local u14 = u12:GetAttribute("Health");
    local u15 = u12:GetAttribute("MaxHealth");

    local function u21(p16, p17) -- Line: 51
        -- upvalues: u11 (copy), u13 (ref), TweenService (ref), u14 (ref), u15 (ref)
        local v18 = {};
        local v19;

        if u13 then
            v19 = math.clamp(p17 - p16, 0, p17);
        else
            v19 = math.max(0, p16);
        end;

        v18.health = v19;
        u11:setState(v18);
        local v20;

        if u13 then
            v20 = math.clamp((p17 - p16) / p17, 0, 1);
        else
            v20 = math.clamp(p16 / p17, 0, 1);
        end;

        TweenService:Create(u11.progressFrame:getValue(), TweenInfo.new(0.3), {
            Size = UDim2.fromScale(v20, 1)
        }):Play();
        u14 = p16;
        u15 = p17;
    end;

    local v22 = u14;
    local v23 = u15;
    u21(v22 == nil and 1 or v22, v23 == nil and 1 or v23);
    u11.maid:GiveTask(u12:GetAttributeChangedSignal("Health"):Connect(function() -- Line: 71
        -- upvalues: u21 (copy), u12 (copy), u15 (ref)
        u21(u12:GetAttribute("Health"), u15);
    end));
    u11.maid:GiveTask(u12:GetAttributeChangedSignal("MaxHealth"):Connect(function() -- Line: 74
        -- upvalues: u21 (copy), u14 (ref), u12 (copy)
        u21(u14, u12:GetAttribute("MaxHealth"));
    end));
    local u24 = EntityUtil:getEntity(u12);

    if u24 then
        local function _(p25) -- Line: 81
            -- upvalues: u11 (copy), u24 (copy), u2 (ref), ShieldType (ref)
            u11.maid:GiveTask(u24:onShieldChanged(p25):Connect(function() -- Line: 82
                -- upvalues: u2 (ref), ShieldType (ref), u24 (ref), u11 (ref)
                local u26 = 0;

                local function _(p27) -- Line: 85
                    -- upvalues: u24 (ref), u26 (ref)
                    local v28 = u24;

                    if v28 ~= nil then
                        v28 = v28:getShield(p27);
                    end;

                    u26 = u26 + (v28 == nil and 0 or v28);
                end;

                for i, v in u2.values(ShieldType) do
                    local _ = i - 1;
                    local v29 = u24;

                    if v29 ~= nil then
                        v29 = v29:getShield(v);
                    end;

                    u26 = u26 + (v29 == nil and 0 or v29);
                end;

                u11:setState({
                    shield = u26
                });
            end));
        end;

        for i, v in u2.values(ShieldType) do
            local _ = i - 1;
            u11.maid:GiveTask(u24:onShieldChanged(v):Connect(function() -- Line: 82
                -- upvalues: u2 (ref), ShieldType (ref), u24 (copy), u11 (copy)
                local u30 = 0;

                local function _(p31) -- Line: 85
                    -- upvalues: u24 (ref), u30 (ref)
                    local v32 = u24;

                    if v32 ~= nil then
                        v32 = v32:getShield(p31);
                    end;

                    u30 = u30 + (v32 == nil and 0 or v32);
                end;

                for i2, v2 in u2.values(ShieldType) do
                    local _ = i2 - 1;
                    local v33 = u24;

                    if v33 ~= nil then
                        v33 = v33:getShield(v2);
                    end;

                    u30 = u30 + (v33 == nil and 0 or v33);
                end;

                u11:setState({
                    shield = u30
                });
            end));
        end;
    end;
end;

function v6.render(p34) -- Line: 109
    -- upvalues: EntityUtil (copy), u2 (copy), ShieldType (copy), u4 (copy), Shield (copy), ColorUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy), Empty (copy)
    local v35 = EntityUtil:getLocalPlayerEntity();
    local v36 = u2.values(ShieldType);

    local function _(p37) -- Line: 112
        -- upvalues: u4 (ref), Shield (ref)
        return u4.createElement(Shield, {
            ShieldType = p37
        });
    end;

    local v38 = table.create(#v36);

    for i, v in v36 do
        local _ = i - 1;
        v38[i] = u4.createElement(Shield, {
            ShieldType = v
        });
    end;

    local v39 = p34.state.health + p34.state.shield;
    local v40;

    if v35 == nil then
        v40 = v35;
    else
        v40 = v35:getMaxHealth();
    end;

    local v41 = ColorUtil.hexColor(13317668);

    if v35 ~= nil then
        v35 = v35:getInstance();
    end;

    if v35 and StatusEffectUtil:isActive(v35, StatusEffectType.DECAY) then
        v41 = ColorUtil.hexColor(13970113);
    end;

    local v42 = {
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.85, 0.2),
        Position = UDim2.fromScale(0.5, -0.2),
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = ColorUtil.hexColor(2700097)
    };
    local v43 = {};
    local v44 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v45 = { u4.createElement("Frame", {
            [u4.Ref] = p34.progressFrame,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = p34.overrideBarColor or v41,
            BorderSizePixel = 0,
            LayoutOrder = 0
        }) };
    local _ = #v45;
    local v46 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v47 = { u4.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            VerticalAlignment = "Center",
            HorizontalAlignment = v39 < (v40 == nil and 100 or v40) and "Left" or "Right"
        }) };
    local v48 = #v47;

    for i, v in v38 do
        v47[v48 + i] = v;
    end;

    v45.ShieldBarContainer = u4.createElement(Empty, v46, v47);
    v43.HealthbarProgressWrapper = u4.createElement(Empty, v44, v45);
    local createElement = u4.createElement;
    local v49 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextScaled = true,
        Font = "LuckiestGuy",
        ZIndex = 11
    };
    local v50 = math.round(p34.state.health);
    local v51 = tostring(v50);
    local v52;

    if p34.state.shield > 0 then
        local v53 = math.round(p34.state.shield);
        v52 = "(+" .. tostring(v53) .. ")";
    else
        v52 = "";
    end;

    v49.Text = v51 .. " " .. v52;
    v49.Size = UDim2.fromScale(0.3, 1.4);
    v49.Position = UDim2.fromScale(0.5, 0);
    v49.AnchorPoint = Vector2.new(0.5, 0.35);
    v49.TextColor3 = Color3.fromRGB(255, 255, 255);
    v43[#v43 + 1] = createElement("TextLabel", v49);

    return u4.createFragment({
        HotbarHealthbarContainer = u4.createElement("Frame", v42, v43)
    });
end;

function v6.willUnmount(p54) -- Line: 197
    p54.characterMaid:DoCleaning();
    p54.maid:DoCleaning();
end;

return {
    HotbarHealthbar = v6
};