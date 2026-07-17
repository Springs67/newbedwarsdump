-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local AfkPlaceUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;

return {
    BattleRoyaleZoneMinimapGUI = v3.new(u2)(function(u5, p6) -- Line: 14
        -- upvalues: Players (copy), WatchCollectionTag (copy), RunService (copy), Workspace (copy), default (copy), u2 (copy), AfkPlaceUtils (copy), ColorUtil (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local v7, u8 = useState(UDim2.fromScale(0.5, 0.5));
        local v9, u10 = useState(UDim2.fromScale(0.5, 0.5));
        local v11, u12 = useState(UDim2.fromScale(0.5, 0.5));
        local v13, u14 = useState(UDim2.fromScale(0.5, 0.5));
        local v15, u16 = useState(UDim2.fromScale(0.5, 0.5));
        local v17, u18 = useState(0);
        local v19, u20 = useState(false);
        local v21, u22 = useState("");
        local u23, u24 = useState({});
        local u25, u26 = useState({});
        local u27 = nil;
        useEffect(function() -- Line: 28
            -- upvalues: Players (ref), WatchCollectionTag (ref), u23 (copy), u24 (copy), RunService (ref), u16 (copy), u27 (ref), Workspace (ref), u18 (copy), u26 (copy), u5 (copy), u12 (copy), u14 (copy), default (ref), u8 (copy), u10 (copy), u20 (copy), u22 (copy)
            local v28 = Players.LocalPlayer:GetAttribute("Team");

            if v28 ~= nil then
                WatchCollectionTag("TEAM_" .. tostring(v28), function(u29) -- Line: 32
                    -- upvalues: Players (ref), u23 (ref), u24 (ref)
                    if not u29 then
                        return nil;
                    end;

                    if u29 == Players.LocalPlayer.Character then
                        return nil;
                    end;

                    if table.find(u23, u29) ~= nil then
                        return nil;
                    end;

                    u24(function(p30) -- Line: 44
                        -- upvalues: u29 (copy)
                        table.insert(p30, u29);

                        return p30;
                    end);
                end);
            end;

            RunService.Heartbeat:Connect(function(p31) -- Line: 50
                -- upvalues: Players (ref), u16 (ref), u27 (ref), Workspace (ref), u18 (ref), u24 (ref), u26 (ref), u23 (ref), u5 (ref), u12 (ref), u14 (ref)
                local LocalPlayer = Players.LocalPlayer;

                if LocalPlayer ~= nil then
                    LocalPlayer = LocalPlayer.Character;

                    if LocalPlayer ~= nil then
                        LocalPlayer = LocalPlayer.PrimaryPart;

                        if LocalPlayer ~= nil then
                            LocalPlayer = LocalPlayer.Position;
                        end;
                    end;
                end;

                if LocalPlayer then
                    u16(u27(LocalPlayer));
                    local CurrentCamera = Workspace.CurrentCamera;

                    if CurrentCamera ~= nil then
                        CurrentCamera = CurrentCamera.CFrame;

                        if CurrentCamera ~= nil then
                            CurrentCamera = CurrentCamera.LookVector;
                        end;
                    end;

                    if CurrentCamera then
                        local v32 = math.atan2(CurrentCamera.X, -CurrentCamera.Z);
                        u18((math.deg(v32)));
                    end;
                end;

                local function v44(u33) -- Line: 80
                    -- upvalues: u24 (ref), u27 (ref), u26 (ref)
                    local v34;

                    if u33 == nil then
                        v34 = u33;
                    else
                        v34 = u33.PrimaryPart;

                        if v34 ~= nil then
                            v34 = v34.Position;
                        end;
                    end;

                    if not v34 then
                        u24(function(p35) -- Line: 91
                            -- upvalues: u33 (copy)
                            local function _(p36) -- Line: 93
                                -- upvalues: u33 (ref)
                                return p36 ~= u33;
                            end;

                            local v37 = 0;
                            local v38 = {};

                            for i, v in p35 do
                                local _ = i - 1;

                                if v ~= u33 == true then
                                    v37 = v37 + 1;
                                    v38[v37] = v;
                                end;
                            end;

                            return v38;
                        end);

                        return nil;
                    end;

                    local u39 = u27(v34);
                    local v40;

                    if u33 == nil then
                        v40 = u33;
                    else
                        v40 = u33.PrimaryPart;

                        if v40 ~= nil then
                            v40 = v40.CFrame;

                            if v40 ~= nil then
                                v40 = v40.LookVector;
                            end;
                        end;
                    end;

                    if not v40 then
                        return nil;
                    end;

                    local v41 = math.atan2(v40.X, -v40.Z);
                    local u42 = math.deg(v41);
                    u26(function(p43) -- Line: 130
                        -- upvalues: u33 (copy), u39 (copy), u42 (copy)
                        p43[u33] = {
                            position = u39,
                            rotation = u42
                        };

                        return p43;
                    end);
                end;

                for i, v in u23 do
                    v44(v, i - 1, u23);
                end;

                if u5.Zone then
                    local v45 = math.clamp(u5.Zone.Size.X / u5.WorldSize.X, 0, 1);
                    local v46 = math.clamp(u5.Zone.Size.Z / u5.WorldSize.Z, 0, 1);
                    u12(UDim2.fromScale(v45, v46));
                    u14(u27(u5.Zone.Position));
                end;
            end);
            local u47 = nil;
            default.Client:Get("BattleRoyaleNextZoneFromServer"):Connect(function(u48) -- Line: 158
                -- upvalues: u5 (ref), u8 (ref), u10 (ref), u27 (ref), u20 (ref), u47 (ref), RunService (ref), Workspace (ref), u22 (ref)
                local v49 = math.clamp(u48.nextZoneSize.X / u5.WorldSize.X, 0, 1);
                local v50 = math.clamp(u48.nextZoneSize.Z / u5.WorldSize.Z, 0, 1);
                u8(UDim2.fromScale(v49, v50));
                u10(u27(u48.nextZonePosition));
                u20(true);

                if u47 then
                    u47:Disconnect();
                end;

                u47 = RunService.Heartbeat:Connect(function(p51) -- Line: 174
                    -- upvalues: u48 (copy), Workspace (ref), u22 (ref), u47 (ref)
                    local v52 = u48.moveWorkspaceTime - Workspace:GetServerTimeNow();
                    local v53 = math.floor(v52 / 60);
                    local v54 = math.floor(v52 % 60);
                    u22(tostring(v53) .. ":" .. (v54 < 10 and "0" or "") .. tostring(v54));

                    if v52 <= 0 then
                        if u47 then
                            u47:Disconnect();
                        end;

                        u22("Void closing!");
                    end;
                end);
            end);
        end, {});

        u27 = function(p55) -- Line: 191
            -- upvalues: u5 (copy)
            local v56 = u5.CenterWorldPosition + Vector3.new(-u5.WorldSize.X / 2, 0, -u5.WorldSize.Z / 2);
            local v57 = math.clamp((p55.X - v56.X) / u5.WorldSize.X, 0, 1);
            local v58 = math.clamp((p55.Z - v56.Z) / u5.WorldSize.Z, 0, 1);

            return UDim2.fromScale(v57, v58);
        end;

        local v59 = {};
        local _ = #v59;

        local function v62(p60) -- Line: 207
            -- upvalues: u25 (copy), u2 (ref)
            local v61 = u25[p60];

            if v61 then
                return u2.createFragment({
                    PartyMemberPositionIndicator = u2.createElement("Frame", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        ZIndex = 150,
                        Position = v61.position,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundColor3 = Color3.fromRGB(224, 209, 43),
                        Size = UDim2.fromScale(0.2, 0.2)
                    }, {
                        PlayerPositionIndicatorImage = u2.createElement("ImageLabel", {
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://84853125356744",
                            ImageTransparency = 0.1,
                            ZIndex = 151,
                            Size = UDim2.fromScale(1, 1),
                            Position = UDim2.fromScale(0.5, 0.5),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            ImageColor3 = Color3.fromRGB(224, 209, 43),
                            Rotation = v61.rotation
                        })
                    })
                });
            end;

            return u2.createElement("Frame");
        end;

        local v63 = table.create(#u23);
        local v64 = {
            DisplayOrder = 20,
            ResetOnSpawn = false
        };

        for i, v in u23 do
            v63[i] = v62(v, i - 1, u23);
        end;

        local v65 = {
            BackgroundTransparency = 0.5,
            LayoutOrder = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(1, 0),
            AnchorPoint = Vector2.new(1, 0),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.fromOffset(u5.MinimapWidth, u5.MinimapWidth)
        };
        local v66 = {
            u2.createElement("UIStroke", {
                Thickness = 1,
                Transparency = 0.5,
                Color = Color3.fromRGB(255, 255, 255)
            }),
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }),
            ZoneBox1 = u2.createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 99,
                Position = v9,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Size = v7,
                Visible = v19
            }, { u2.createElement("UIStroke", {
                    Thickness = 2,
                    Transparency = 0.1,
                    Color = Color3.fromRGB(255, 255, 255)
                }) }),
            ZoneBox2 = u2.createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 100,
                Position = v13,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(82, 212, 61),
                Size = v11,
                Visible = v19
            }, { u2.createElement("UIStroke", {
                    Thickness = 1,
                    Transparency = 0.1,
                    Color = Color3.fromRGB(227, 61, 61)
                }) }),
            PlayerPositionIndicator = u2.createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 155,
                Position = v15,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(87, 209, 64),
                Size = UDim2.fromScale(0.2, 0.2)
            }, {
                PlayerPositionIndicatorImage = u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://84853125356744",
                    ImageTransparency = 0.1,
                    ZIndex = 156,
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    ImageColor3 = Color3.fromRGB(87, 209, 64),
                    Rotation = v17
                })
            })
        };
        local v67 = #v66;

        for i, v in v63 do
            v66[v67 + i] = v;
        end;

        v66[#v66 + 1] = u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextStrokeTransparency = 1,
            TextTransparency = 0.2,
            TextScaled = true,
            SizeConstraint = "RelativeYY",
            ZIndex = 200,
            Text = v21,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 1.1),
            Size = UDim2.fromScale(1, 0.2),
            FontFace = Font.fromName("GothamBold", Enum.FontWeight.Bold),
            AutomaticSize = Enum.AutomaticSize.X,
            Font = AfkPlaceUtils.Theme.font,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextColor3 = ColorUtil.WHITE
        });
        v59.Background = u2.createElement("Frame", v65, v66);

        return u2.createElement("ScreenGui", v64, v59);
    end)
};