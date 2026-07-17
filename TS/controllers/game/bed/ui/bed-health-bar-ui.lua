-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local ProgressBar = v1.ProgressBar;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedPlatingUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    BedHealthBarUi = v4.new(u3)(function(u6, p7) -- Line: 21
        -- upvalues: Workspace (copy), StringUtil (copy), u3 (copy), getItemMeta (copy), ItemType (copy), BlockEngine (copy), ClientStore (copy), BedPlatingUtil (copy), TweenService (copy), u2 (copy), ProgressBar (copy), Empty (copy), BedwarsImageId (copy), Theme (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;

        local function _(p8) -- Line: 24
            -- upvalues: Workspace (ref), StringUtil (ref)
            local v9 = p8 - Workspace:GetServerTimeNow();
            local v10 = math.max(0, v9);

            if v10 == 0 then
                return nil;
            end;

            return StringUtil.formatCountdownTime(v10, {
                hours = false,
                days = false,
                seperator = ":"
            });
        end;

        local v11 = u6.BedBlock:GetAttribute("TeamId");
        local u12 = u3.createRef();
        local PlatingExpireTime = u6.PlatingExpireTime;
        local v13 = (PlatingExpireTime == nil and 0 or PlatingExpireTime) - Workspace:GetServerTimeNow();
        local v14 = math.max(0, v13);
        local v15;

        if v14 == 0 then
            v15 = nil;
        else
            v15 = StringUtil.formatCountdownTime(v14, {
                hours = false,
                days = false,
                seperator = ":"
            });
        end;

        local v16, u17 = useState(v15);
        local ShieldExpireTime = u6.ShieldExpireTime;
        local v18 = (ShieldExpireTime == nil and 0 or ShieldExpireTime) - Workspace:GetServerTimeNow();
        local v19 = math.max(0, v18);
        local v20;

        if v19 == 0 then
            v20 = nil;
        else
            v20 = StringUtil.formatCountdownTime(v19, {
                hours = false,
                days = false,
                seperator = ":"
            });
        end;

        local v21, u22 = useState(v20);
        local v23 = u6.BedBlock:GetAttribute("BedPlatingAmount");
        local v24, u25 = useState(v23 == nil and 0 or v23);
        local v26 = u6.BedBlock:GetAttribute("MaxHealth");

        if v26 == nil then
            local block = getItemMeta(ItemType.BED).block;

            if block ~= nil then
                block = block.health;
            end;

            v26 = block == nil and 18 or block;
        end;

        local v27 = u6.BedBlock:GetAttribute("Health");
        local v28 = BlockEngine:getStore():getBlockData(BlockEngine:getBlockPosition(u6.BedBlock.Position));

        if v28 then
            v27 = v28:GetAttribute("Health");
        end;

        if v27 == 0 or (v27 ~= v27 or not v27) then
            v27 = v26;
        end;

        local v29, u30 = useState(v27 == nil and 0 or v27);
        ClientStore:dispatch({
            type = "SetBedHealth",
            teamId = v11,
            bedHealth = v29,
            maxBedHealth = v26
        });
        local v31 = u6.BedBlock:GetAttribute("BedPlatingTotal");

        if v31 == nil then
            v31 = BedPlatingUtil.BED_PLATING_AMOUNT;
        end;

        local v32, u33 = useState(0);
        useEffect(function() -- Line: 90
            -- upvalues: u6 (copy), u33 (copy)
            local u34 = u6.BedBlock:GetAttributeChangedSignal("PunctureCount"):Connect(function() -- Line: 91
                -- upvalues: u33 (ref), u6 (ref)
                u33(u6.BedBlock:GetAttribute("PunctureCount"));
            end);

            return function() -- Line: 94
                -- upvalues: u34 (copy)
                u34:Disconnect();
            end;
        end, {});
        useEffect(function() -- Line: 99
            -- upvalues: u12 (copy), u6 (copy), TweenService (ref)
            local v35 = u12:getValue();

            if not v35 then
                return nil;
            end;

            if u6.ShieldExpireTime == nil then
                return nil;
            end;

            local u36 = TweenService:Create(v35, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Transparency = 0.85
            });
            local u37 = TweenService:Create(v35, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Transparency = 0
            });
            u36:Play();
            u36.Completed:Connect(function() -- Line: 114
                -- upvalues: u37 (copy)
                u37:Play();
            end);
            u37.Completed:Connect(function() -- Line: 117
                -- upvalues: u36 (copy)
                u36:Play();
            end);

            return function() -- Line: 120
                -- upvalues: u36 (copy), u37 (copy)
                u36:Destroy();
                u37:Destroy();
            end;
        end, { u6.ShieldExpireTime });
        useEffect(function() -- Line: 125
            -- upvalues: u2 (ref), u6 (copy), u25 (copy), BlockEngine (ref), u30 (copy), u17 (copy), Workspace (ref), StringUtil (ref), u22 (copy)
            local u38 = true;
            local u39 = u2.new();
            u39:GiveTask(u6.BedBlock:GetAttributeChangedSignal("BedPlatingAmount"):Connect(function() -- Line: 128
                -- upvalues: u6 (ref), u25 (ref)
                local v40 = u6.BedBlock:GetAttribute("BedPlatingAmount");

                if v40 ~= 0 and (v40 == v40 and v40) then
                    u25(v40);
                end;
            end));
            task.spawn(function() -- Line: 134
                -- upvalues: u38 (ref), BlockEngine (ref), u6 (ref), u30 (ref), u39 (copy)
                local v41 = false;

                while true do
                    local v42 = task.wait(0.25);

                    if v42 ~= 0 and (v42 == v42 and v42) then
                        v42 = u38 and not v41;
                    end;

                    if v42 == 0 or (v42 ~= v42 or not v42) then
                        return;
                    end;

                    local u43 = BlockEngine:getStore():getBlockData(BlockEngine:getBlockPosition(u6.BedBlock.Position));

                    if u43 then
                        v41 = true;
                        local v44 = u43:GetAttribute("Health");

                        if v44 ~= 0 and (v44 == v44 and v44) then
                            u30(v44);
                        end;

                        u39:GiveTask(u43:GetAttributeChangedSignal("Health"):Connect(function() -- Line: 151
                            -- upvalues: u43 (copy), u30 (ref)
                            local v45 = u43:GetAttribute("Health");

                            if v45 ~= 0 and (v45 == v45 and v45) then
                                u30(v45);
                            end;
                        end));
                    end;
                end;
            end);
            task.spawn(function() -- Line: 160
                -- upvalues: u38 (ref), u6 (ref), u17 (ref), Workspace (ref), StringUtil (ref)
                while true do
                    local v46 = task.wait(1);

                    if v46 ~= 0 and (v46 == v46 and v46) then
                        v46 = u38;
                    end;

                    if v46 == 0 or (v46 ~= v46 or not v46) then
                        return;
                    end;

                    local PlatingExpireTime2 = u6.PlatingExpireTime;
                    local v47 = (PlatingExpireTime2 == nil and 0 or PlatingExpireTime2) - Workspace:GetServerTimeNow();
                    local v48 = math.max(0, v47);
                    local v49;

                    if v48 == 0 then
                        v49 = nil;
                    else
                        v49 = StringUtil.formatCountdownTime(v48, {
                            hours = false,
                            days = false,
                            seperator = ":"
                        });
                    end;

                    u17(v49);
                end;
            end);
            task.spawn(function() -- Line: 176
                -- upvalues: u38 (ref), u6 (ref), u22 (ref), Workspace (ref), StringUtil (ref)
                while true do
                    local v50 = task.wait(1);

                    if v50 ~= 0 and (v50 == v50 and v50) then
                        v50 = u38;
                    end;

                    if v50 == 0 or (v50 ~= v50 or not v50) then
                        return;
                    end;

                    local ShieldExpireTime2 = u6.ShieldExpireTime;
                    local v51 = (ShieldExpireTime2 == nil and 0 or ShieldExpireTime2) - Workspace:GetServerTimeNow();
                    local v52 = math.max(0, v51);
                    local v53;

                    if v52 == 0 then
                        v53 = nil;
                    else
                        v53 = StringUtil.formatCountdownTime(v52, {
                            hours = false,
                            days = false,
                            seperator = ":"
                        });
                    end;

                    u22(v53);
                end;
            end);

            return function() -- Line: 192
                -- upvalues: u38 (ref), u39 (copy)
                u38 = false;
                u39:DoCleaning();
            end;
        end, { u6.PlatingExpireTime, u6.ShieldExpireTime });
        local v54 = u6.ShieldExpireTime ~= nil and true or u6.PlatingExpireTime ~= nil;
        local v55 = {
            StudsOffsetWorldSpace = Vector3.new(0, 4.5, 1.5),
            ResetOnSpawn = false,
            MaxDistance = 150,
            Adornee = u6.BedBlock,
            Size = UDim2.fromScale(8, 2)
        };
        local v56 = {};

        if v54 then
            local v57 = {
                Size = UDim2.fromScale(1, 0.4)
            };
            local v58 = {};
            local _ = #v58;
            local v59 = {
                Size = UDim2.fromScale(0.88, 1)
            };
            local v60 = {};
            local v61;

            if u6.ShieldExpireTime == nil then
                v61 = u3.createFragment({
                    PlatingBar = u3.createElement(ProgressBar, {
                        GradientRotation = 0,
                        AcceptZero = true,
                        AutoLocalize = false,
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.fromScale(0, 0.5),
                        Size = UDim2.fromScale(1, 0.8),
                        Progress = v24 / v31,
                        BarGradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(59, 125, 196)), ColorSequenceKeypoint.new(1, Color3.fromRGB(88, 213, 253)) }),
                        BarCornerRadius = UDim.new(0.1),
                        BarOnlyChildren = { u3.createElement(Empty, {
                                ZIndex = 4,
                                AnchorPoint = Vector2.new(0, 0.5),
                                Position = UDim2.fromScale(0, 0.5),
                                Size = UDim2.new(1, -2, 1, -4)
                            }, { u3.createElement("UICorner", {
                                    CornerRadius = UDim.new(0.1)
                                }), u3.createElement("UIStroke", {
                                    Transparency = 0.55,
                                    Thickness = 2,
                                    Color = Color3.fromRGB(255, 255, 255)
                                }) }) }
                    })
                });
            else
                v61 = u3.createElement(Empty, {
                    [u3.Ref] = u12,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.fromScale(0, 0.5),
                    Size = UDim2.fromScale(1, 0.85),
                    BackgroundColor3 = Color3.fromRGB(88, 213, 253)
                }, { u3.createElement("UIStroke", {
                        Thickness = 2,
                        Color = Color3.fromRGB(88, 213, 253)
                    }), u3.createElement("UICorner", {
                        CornerRadius = UDim.new(0.1)
                    }) });
            end;

            v60[1] = v61;
            local v62 = #v60;
            local v63;

            if u6.PlatingExpireTime == nil or v16 == nil then
                v63 = false;
            else
                v63 = u3.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    TextXAlignment = "Center",
                    TextYAlignment = "Center",
                    TextStrokeTransparency = 0,
                    ZIndex = 60,
                    Text = v16,
                    Size = UDim2.fromScale(1, 1),
                    FontFace = Font.fromName("RobotoMono", Enum.FontWeight.Bold),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                });
            end;

            if v63 then
                v60[v62 + 1] = v63;
            end;

            local v64 = #v60;
            local v65;

            if u6.ShieldExpireTime == nil or v21 == nil then
                v65 = false;
            else
                v65 = u3.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    TextXAlignment = "Center",
                    TextYAlignment = "Center",
                    TextStrokeTransparency = 0,
                    ZIndex = 60,
                    Text = v21,
                    Size = UDim2.fromScale(1, 1),
                    FontFace = Font.fromName("RobotoMono", Enum.FontWeight.Bold),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                });
            end;

            if v65 then
                v60[v64 + 1] = v65;
            end;

            v58.ShieldBarWrapper = u3.createElement(Empty, v59, v60);
            v58.BarIcon = u3.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ZIndex = 6,
                Image = BedwarsImageId.BED_PLATING_ICON,
                ImageColor3 = Color3.fromRGB(88, 213, 253),
                Position = UDim2.fromScale(0, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                SizeConstraint = Enum.SizeConstraint.RelativeYY
            });
            v54 = u3.createFragment({
                ShieldAndPlatingContainer = u3.createElement(Empty, v57, v58)
            });
        end;

        local v66 = {
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0, 0)
        };
        local v67 = {};
        local v68 = #v67;

        if v54 then
            v67[v68 + 1] = v54;
        end;

        local v69 = #v67;
        local v70;

        if v32 > 0 then
            v70 = u3.createFragment({
                PunctureContainer = u3.createElement(Empty, {
                    Size = UDim2.fromScale(1, 0.4)
                }, { u3.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        TextScaled = true,
                        TextXAlignment = "Center",
                        TextYAlignment = "Center",
                        TextStrokeTransparency = 1,
                        ZIndex = 60,
                        Text = "PUNCTURES: " .. tostring(v32),
                        Size = UDim2.fromScale(1, 1),
                        FontFace = Font.fromName("RobotoMono", Enum.FontWeight.Bold),
                        TextColor3 = Theme.mcDarkRed,
                        TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                    }) })
            });
        else
            v70 = false;
        end;

        if v70 then
            v67[v69 + 1] = v70;
        end;

        local _ = #v67;
        v67.HealthContainer = u3.createElement(Empty, {
            Position = UDim2.fromScale(0, 0.4),
            Size = UDim2.fromScale(1, 0.4)
        }, {
            HealthBarWrapper = u3.createElement(Empty, {
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0, 0.5),
                Size = UDim2.fromScale(0.88, 1)
            }, {
                HealthBar = u3.createElement(ProgressBar, {
                    GradientRotation = 0,
                    AcceptZero = true,
                    AutoLocalize = false,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.fromScale(0, 0.5),
                    Size = UDim2.fromScale(1, 0.8),
                    Progress = v29 / v26,
                    BarGradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 161, 45)), ColorSequenceKeypoint.new(1, Color3.fromRGB(53, 238, 49)) }),
                    BarCornerRadius = UDim.new(0.1),
                    BarOnlyChildren = { u3.createElement(Empty, {
                            ZIndex = 4,
                            AnchorPoint = Vector2.new(0, 0.5),
                            Position = UDim2.fromScale(0, 0.5),
                            Size = UDim2.new(1, -2, 1, -4)
                        }, { u3.createElement("UICorner", {
                                CornerRadius = UDim.new(0.1)
                            }), u3.createElement("UIStroke", {
                                Transparency = 0.55,
                                Thickness = 2,
                                Color = Color3.fromRGB(255, 255, 255)
                            }) }) }
                })
            }),
            BarIcon = u3.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ZIndex = 6,
                Image = BedwarsImageId.BED_HEALTH_ICON,
                ImageColor3 = Color3.fromRGB(53, 238, 49),
                Position = UDim2.fromScale(0, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                SizeConstraint = Enum.SizeConstraint.RelativeYY
            })
        });
        v56[#v56 + 1] = u3.createElement(Empty, v66, v67);

        return u3.createFragment({
            BedHealthBillboard = u3.createElement("BillboardGui", v55, v56)
        });
    end)
};