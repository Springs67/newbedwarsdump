-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local Healthbar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "hotbar", "ui", "healthbar", "healthbar").Healthbar;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local ShieldType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shield", "shield-type").ShieldType;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u7 = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
local v80 = v5.new(u4)(function(u8, p9) -- Line: 21
    -- upvalues: Theme (copy), u4 (copy), u3 (copy), EntityUtil (copy), u2 (copy), ShieldType (copy), TweenService (copy), u7 (copy), DeviceUtil (copy), KnitClient (copy), getQueueMeta (copy), Empty (copy), Healthbar (copy), ColorUtil (copy)
    local useState = p9.useState;
    local useEffect = p9.useEffect;
    local v10, u11 = useState(1);
    local v12, u13 = useState(0);
    local v14, u15 = useState(nil);
    local v16, u17 = useState(0);
    local LocalPlayerTeam = u8.LocalPlayerTeam;

    if LocalPlayerTeam ~= nil then
        LocalPlayerTeam = LocalPlayerTeam.id;
    end;

    local v18 = tonumber(LocalPlayerTeam);

    if v14 ~= nil then
        v14 = v14.id;
    end;

    local v19;

    if v18 == tonumber(v14) then
        v19 = Theme.mcGreen;
    else
        v19 = Theme.mcRed;
    end;

    if u8.barColor then
        v19 = u8.barColor;
    end;

    local u20 = u4.createRef();
    useEffect(function() -- Line: 43
        -- upvalues: u3 (ref), u20 (copy), EntityUtil (ref), u8 (copy), u11 (copy), u2 (ref), ShieldType (ref), u13 (copy), TweenService (ref), u7 (ref), u17 (copy), DeviceUtil (ref), KnitClient (ref), getQueueMeta (ref), u15 (copy)
        local u21 = u3.new();
        local u22 = u20:getValue();
        local u23 = EntityUtil:getEntity(u8.gameEntity);
        u8.serverInstance:SetAttribute("InvertHp", u8.invertHp);
        local v24 = u8.serverInstance:GetAttribute("Health");
        local v25 = u8.serverInstance:GetAttribute("MaxHealth");
        local v26;

        if u8.invertHp then
            v26 = (v25 - v24) / v25;
        else
            v26 = v24 / v25;
        end;

        u11(v26);
        local v27 = u2.values(ShieldType);

        local function _(p28, p29) -- Line: 55
            -- upvalues: u23 (copy)
            local v30 = u23;

            if v30 ~= nil then
                v30 = v30:getShield(p29);
            end;

            return p28 + (v30 == nil and 0 or v30);
        end;

        local v31 = 0;

        for i = 1, #v27 do
            local v32 = v27[i];
            local _ = i - 1;
            local v33;

            if u23 == nil then
                v33 = u23;
            else
                v33 = u23:getShield(v32);
            end;

            v31 = v31 + (v33 == nil and 0 or v33);
        end;

        u13(v31);
        u21:GiveTask(u8.serverInstance:GetAttributeChangedSignal("Health"):Connect(function() -- Line: 77
            -- upvalues: u8 (ref), u11 (ref), u22 (copy), TweenService (ref), u7 (ref)
            if not (u8.serverInstance and u8.serverInstance.Parent) then
                return nil;
            end;

            local v34 = u8.serverInstance:GetAttribute("Health");
            local v35 = u8.serverInstance:GetAttribute("MaxHealth");
            local v36;

            if u8.serverInstance:GetAttribute("InvertHp") and true or false then
                v36 = (v35 - v34) / v35;
            else
                v36 = v34 / v35;
            end;

            u11(v36);

            if u22 then
                TweenService:Create(u22, u7, {
                    Size = UDim2.fromScale(v36, 1)
                }):Play();
            end;
        end));
        u21:GiveTask(u8.serverInstance:GetAttributeChangedSignal("AdditionalHealthBarStatRatio"):Connect(function() -- Line: 94
            -- upvalues: u8 (ref), u17 (ref)
            if not (u8.serverInstance and u8.serverInstance.Parent) then
                return nil;
            end;

            local v37 = u8.serverInstance:GetAttribute("AdditionalHealthBarStatRatio");
            u17((math.min(1, v37 == nil and 0 or v37)));
        end));

        if not DeviceUtil.isHoarceKat() then
            local u38 = u8.gameEntity:GetAttribute("Team");
            KnitClient.Controllers.MatchController:getQueueTypeAsync():andThen(function(p39) -- Line: 109
                -- upvalues: getQueueMeta (ref), u38 (copy), u15 (ref)
                local function _(p40) -- Line: 111
                    -- upvalues: u38 (ref)
                    return tonumber(p40.id) == tonumber(u38);
                end;

                local v41 = nil;

                for i, v in getQueueMeta(p39).teams do
                    local _ = i - 1;

                    if tonumber(v.id) == tonumber(u38) == true then
                        v41 = v;
                        break;
                    end;
                end;

                if v41 then
                    u15(v41);
                end;
            end);
        end;

        u21:GiveTask(u8.gameEntity:GetAttributeChangedSignal("Team"):Connect(function() -- Line: 130
            -- upvalues: u8 (ref), KnitClient (ref), getQueueMeta (ref), u15 (ref)
            local u42 = u8.gameEntity:GetAttribute("Team");
            KnitClient.Controllers.MatchController:getQueueTypeAsync():andThen(function(p43) -- Line: 133
                -- upvalues: getQueueMeta (ref), u42 (copy), u15 (ref)
                local function _(p44) -- Line: 135
                    -- upvalues: u42 (ref)
                    return tonumber(p44.id) == tonumber(u42);
                end;

                local v45 = nil;

                for i, v in getQueueMeta(p43).teams do
                    local _ = i - 1;

                    if tonumber(v.id) == tonumber(u42) == true then
                        v45 = v;
                        break;
                    end;
                end;

                if v45 then
                    u15(v45);
                end;
            end);
        end));

        if u23 then
            local function _(p46) -- Line: 157
                -- upvalues: u21 (copy), u23 (copy), u2 (ref), ShieldType (ref), u13 (ref)
                u21:GiveTask(u23:onShieldChanged(p46):Connect(function() -- Line: 158
                    -- upvalues: u2 (ref), ShieldType (ref), u23 (ref), u13 (ref)
                    local u47 = 0;

                    local function _(p48) -- Line: 161
                        -- upvalues: u23 (ref), u47 (ref)
                        local v49 = u23:getShield(p48);
                        u47 = u47 + (v49 == nil and 0 or v49);
                    end;

                    for i, v in u2.values(ShieldType) do
                        local _ = i - 1;
                        local v50 = u23:getShield(v);
                        u47 = u47 + (v50 == nil and 0 or v50);
                    end;

                    u13(u47);
                end));
            end;

            for i, v in u2.values(ShieldType) do
                local _ = i - 1;
                u21:GiveTask(u23:onShieldChanged(v):Connect(function() -- Line: 158
                    -- upvalues: u2 (ref), ShieldType (ref), u23 (copy), u13 (ref)
                    local u51 = 0;

                    local function _(p52) -- Line: 161
                        -- upvalues: u23 (ref), u51 (ref)
                        local v53 = u23:getShield(p52);
                        u51 = u51 + (v53 == nil and 0 or v53);
                    end;

                    for i2, v2 in u2.values(ShieldType) do
                        local _ = i2 - 1;
                        local v54 = u23:getShield(v2);
                        u51 = u51 + (v54 == nil and 0 or v54);
                    end;

                    u13(u51);
                end));
            end;
        end;

        return function() -- Line: 178
            -- upvalues: u21 (copy)
            u21:DoCleaning();
        end;
    end, {});
    useEffect(function() -- Line: 182
        -- upvalues: u8 (copy), u11 (copy)
        u8.serverInstance:SetAttribute("InvertHp", u8.invertHp);
        local v55 = u8.serverInstance:GetAttribute("Health");
        local v56 = u8.serverInstance:GetAttribute("MaxHealth");
        local v57;

        if u8.invertHp then
            v57 = (v56 - v55) / v56;
        else
            v57 = v55 / v56;
        end;

        u11(v57);
    end, { u8.invertHp });
    local v58 = u8.serverInstance:GetAttribute("Health") + v12;
    local v59 = {};
    local v60 = EntityUtil:getEntity(u8.gameEntity);

    if v60 ~= nil then
        v60 = v60:getMaxHealth();
    end;

    local v61 = (v60 == nil and 0 or v60) - 1;
    local v62 = math.max(v61, v58 - 1) / 50;
    local v63 = math.floor(v62);
    local v64 = math.min(v63, 30);
    local v65 = false;
    local v66 = 1;

    while true do
        if v65 then
            v66 = v66 + 1;
        else
            v65 = true;
        end;

        if v66 > v64 then
            local v67 = {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Size = u8.size or UDim2.fromScale(1, 0.8),
                Position = u8.position,
                AnchorPoint = u8.anchorPoint,
                LayoutOrder = u8.layoutOrder
            };
            local v68 = { u4.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    HorizontalAlignment = "Center",
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0.03, 0)
                }) };
            local v69 = #v68;
            local v70 = {
                BackgroundTransparency = 0.5,
                BorderSizePixel = 1,
                ClipsDescendants = true,
                LayoutOrder = 0
            };
            local v71;

            if v16 > 0 then
                v71 = UDim2.fromScale(1, 0.685);
            else
                v71 = UDim2.fromScale(1, 1);
            end;

            v70.Size = v71;
            v70.BorderColor3 = v19;
            v70.BackgroundColor3 = Theme.Gray;
            local v72 = {
                ShieldBarContainer = u4.createElement(Empty, {
                    ZIndex = 2,
                    Size = UDim2.fromScale(1, 1)
                }, { u4.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        VerticalAlignment = "Center",
                        HorizontalAlignment = v58 < v61 and "Left" or "Right"
                    }), u4.createElement(Healthbar, {
                        FillRatio = 1,
                        BarTweenSpeed = 0.01,
                        ZIndex = 2,
                        Size = UDim2.fromScale(math.min(1, v12 / (v61 + v12)), 1),
                        FillColor = ColorSequence.new(Color3.fromRGB(240, 240, 240), Color3.fromRGB(199, 199, 199)),
                        BackgroundColor = ColorSequence.new(Color3.fromRGB(0, 0, 0))
                    }) })
            };
            local v73 = #v72;

            for i, v in v59 do
                v72[v73 + i] = v;
            end;

            local _ = #v72;
            local v74 = {
                BackgroundTransparency = 0,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(v10, 1),
                BackgroundColor3 = v19
            };
            local v75 = {};
            local v76 = #v75;
            local v77 = u8[u4.Children];

            if v77 then
                for i, v in v77 do
                    if type(i) == "number" then
                        v75[v76 + i] = v;
                    else
                        v75[i] = v;
                    end;
                end;
            end;

            v72.HpBarOuter = u4.createElement("Frame", v74, v75);
            v72.HpBarMiddle = u4.createElement("Frame", {
                Size = UDim2.fromScale(0, 1),
                BackgroundTransparency = 0,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                [u4.Ref] = u20
            });
            v68.HpBarInner = u4.createElement("Frame", v70, v72);
            local v78;

            if v16 > 0 then
                v78 = u4.createFragment({
                    AdditionalStatBar = u4.createElement("Frame", {
                        BackgroundTransparency = 0.7,
                        BorderSizePixel = 1,
                        ClipsDescendants = true,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.285),
                        BorderColor3 = v19,
                        BackgroundColor3 = Theme.Gray
                    }, {
                        BarBackground = u4.createElement("Frame", {
                            BackgroundTransparency = 0.7,
                            BorderSizePixel = 0,
                            Size = UDim2.fromScale(1, 1),
                            BackgroundColor3 = ColorUtil.WHITE
                        }, {
                            u4.createElement("UIGradient", {
                                Color = ColorSequence.new(Color3.fromRGB(120, 120, 120))
                            }),
                            BarFill = u4.createElement("Frame", {
                                BackgroundTransparency = 0,
                                BorderSizePixel = 0,
                                Size = UDim2.fromScale(v16, 1),
                                BackgroundColor3 = ColorUtil.WHITE
                            }, { u4.createElement("UIGradient", {
                                    Color = ColorSequence.new(Color3.fromRGB(140, 169, 200))
                                }) })
                        })
                    })
                });
            else
                v78 = false;
            end;

            if v78 then
                v68[v69 + 1] = v78;
            end;

            return u4.createFragment({
                ContainerFrame = u4.createElement("Frame", v67, v68)
            });
        end;

        local v79 = u4.createFragment({
            Tick = u4.createElement("Frame", {
                BorderSizePixel = 0,
                ZIndex = 10,
                Size = UDim2.new(0, 2, v66 % 4 == 0 and 0.7 or 0.5, 0),
                Position = UDim2.fromScale(v66 / (v64 + 1), 0),
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            })
        });
        table.insert(v59, v79);
    end;
end);

return {
    StatefulEntityHpBar = v6.connect(function(p81, p82) -- Line: 348
        local v83 = {};

        for i, v in p82 do
            v83[i] = v;
        end;

        v83.LocalPlayerTeam = p81.Game.myTeam;

        return v83;
    end)(v80)
};