-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PvPArenaAugmentIcon = RuntimeLib.import(script, script.Parent, "pvp-arena-augment-icon").PvPArenaAugmentIcon;
local v34 = v4.new(u3)(function(u6, p7) -- Line: 13
    -- upvalues: u3 (copy), TweenService (copy), u2 (copy), ColorUtil (copy), Theme (copy), Empty (copy), PvPArenaAugmentIcon (copy)
    local _ = p7.useState;
    local useEffect = p7.useEffect;
    local u8 = u3.createRef();
    useEffect(function() -- Line: 17
        -- upvalues: u8 (copy), TweenService (ref)
        local v9 = u8:getValue();

        if not v9 then
            return nil;
        end;

        TweenService:Create(v9, TweenInfo.new(1), {
            Position = UDim2.fromScale(0, 0)
        }):Play();
    end, {});
    local v10 = u2.values(u6.team.members);

    local function v29(p11, p12) -- Line: 28
        -- upvalues: u3 (ref), ColorUtil (ref), Theme (ref), Empty (ref), u6 (copy), PvPArenaAugmentIcon (ref), u2 (ref)
        local v13 = {};
        local v14 = #v13;
        local v15 = {
            ZIndex = -9,
            Size = UDim2.fromScale(0.485, 1)
        };
        local v16 = { u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0.06, 0),
                PaddingBottom = UDim.new(0.06, 0),
                PaddingLeft = UDim.new(0.03, 0),
                PaddingRight = UDim.new(0.03, 0)
            }) };
        local v17 = #v16;
        local v18 = {
            ZIndex = -9,
            Size = UDim2.fromScale(0.25, 1)
        };
        local v19 = {};
        local _ = #v19;
        local v20 = {
            BackgroundTransparency = 0.1,
            Size = UDim2.fromScale(1, 1),
            SizeConstraint = Enum.SizeConstraint.RelativeXX,
            BackgroundColor3 = ColorUtil.WHITE
        };
        local userId = p11.userId;
        local v21;

        if userId == 0 or (userId ~= userId or not userId) then
            v21 = nil;
        else
            v21 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(p11.userId) .. "&w=48&h=48";
        end;

        v20.Image = v21;
        v20.ZIndex = -9;
        v19["PlayerCard" .. tostring(p11.userId)] = u3.createElement("ImageLabel", v20, { u3.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), u3.createElement("UIStroke", {
                Thickness = 3,
                Transparency = 0,
                Color = Theme.backgroundSecondary
            }) });
        v16[v17 + 1] = u3.createElement(Empty, v18, v19);
        local userIdAugmentMap = u6.userIdAugmentMap;

        if userIdAugmentMap ~= nil then
            local v22 = userIdAugmentMap[p11.userId];

            if v22 == nil then
                userIdAugmentMap = v22;
            else
                local function v24(p23) -- Line: 75
                    -- upvalues: u3 (ref), PvPArenaAugmentIcon (ref)
                    return u3.createFragment({
                        ["PvPArenaAugmentIcon" .. p23] = u3.createElement(PvPArenaAugmentIcon, {
                            EnableTooltip = true,
                            Augment = p23,
                            FrameProps = {
                                ZIndex = -9
                            }
                        }, { u3.createElement("UIAspectRatioConstraint", {
                                AspectRatio = 1
                            }) })
                    });
                end;

                userIdAugmentMap = table.create(#v22);

                for i, v in v22 do
                    userIdAugmentMap[i] = v24(v, i - 1, v22);
                end;
            end;
        end;

        local v25 = {
            ZIndex = -9,
            Size = UDim2.fromScale(0.75, 1),
            Position = UDim2.fromScale(0.25, 0)
        };
        local v26 = { u3.createElement("UIGridLayout", {
                FillDirectionMaxCells = 3,
                FillDirection = Enum.FillDirection.Horizontal,
                CellSize = UDim2.fromScale(0.3, 0.5),
                CellPadding = UDim2.fromOffset(0, 0)
            }) };
        local v27 = #v26;

        if userIdAugmentMap then
            for i, v in userIdAugmentMap do
                v26[v27 + i] = v;
            end;
        end;

        v16[v17 + 2] = u3.createElement(Empty, v25, v26);
        v13[v14 + 1] = u3.createElement(Empty, v15, v16);
        local v28;

        if p12 < #u2.values(u6.team.members) - 1 then
            v28 = u3.createFragment({
                Divider = u3.createElement("Frame", {
                    BorderSizePixel = 0,
                    ZIndex = -9,
                    Size = UDim2.fromScale(0.01, 1),
                    BackgroundColor3 = Theme.backgroundTertiary
                })
            });
        else
            v28 = false;
        end;

        if v28 then
            v13[v14 + 2] = v28;
        end;

        return u3.createFragment(v13);
    end;

    local v30 = table.create(#v10);

    for i, v in v10 do
        v30[i] = v29(v, i - 1, v10);
    end;

    local v31 = {
        Size = UDim2.fromScale(2, 1),
        ZIndex = -99,
        [u3.Ref] = u8,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(2, 0),
        BackgroundColor3 = Theme.backgroundSecondary
    };
    local v32 = { u3.createElement("UIStroke", {
            Thickness = 3,
            Transparency = 0,
            Color = Theme.backgroundTertiary
        }), u3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }) };
    local v33 = #v32;

    for i, v in v30 do
        v32[v33 + i] = v;
    end;

    return u3.createFragment({
        ["PvpArenaAugmentTeamCard" .. u6.team.id] = u3.createElement("Frame", v31, v32)
    });
end);

return {
    PvpArenaAugmentTeamCard = v5.connect(function(p35, p36) -- Line: 169
        local v37 = {};

        for i, v in p36 do
            v37[i] = v;
        end;

        local pvpArena = p35.Bedwars.pvpArena;

        if pvpArena ~= nil then
            pvpArena = pvpArena.userIdAugmentMap;
        end;

        v37.userIdAugmentMap = pvpArena;

        return v37;
    end)(v34)
};