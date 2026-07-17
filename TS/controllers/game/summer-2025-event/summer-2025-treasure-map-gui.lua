-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    Summer2025TreasureMapGUI = v3.new(u2)(function(u5, p6) -- Line: 11
        -- upvalues: u1 (copy), RunService (copy), Players (copy), Workspace (copy), u2 (copy), BedwarsImageId (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local v7, u8 = useState(UDim2.fromScale(0.5, 0.5));
        local v9, u10 = useState(0);
        local v11, u12 = useState(UDim2.fromScale(0.5, 0.5));
        local u13 = u1.new();
        local u14 = nil;
        useEffect(function() -- Line: 19
            -- upvalues: RunService (ref), Players (ref), u8 (copy), u14 (ref), Workspace (ref), u10 (copy), u5 (copy), u12 (copy), u13 (copy)
            u13:GiveTask((RunService.Heartbeat:Connect(function(p15) -- Line: 20
                -- upvalues: Players (ref), u8 (ref), u14 (ref), Workspace (ref), u10 (ref), u5 (ref), u12 (ref)
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
                    u8(u14(LocalPlayer));
                    local CurrentCamera = Workspace.CurrentCamera;

                    if CurrentCamera ~= nil then
                        CurrentCamera = CurrentCamera.CFrame;

                        if CurrentCamera ~= nil then
                            CurrentCamera = CurrentCamera.LookVector;
                        end;
                    end;

                    if CurrentCamera then
                        local v16 = math.atan2(CurrentCamera.X, -CurrentCamera.Z);
                        u10((math.deg(v16)));
                    end;
                end;

                if u5.TreasureModel then
                    u12(u14(u5.TreasureModel:GetPivot().Position));
                end;
            end)));

            return function() -- Line: 56
                -- upvalues: u13 (ref)
                u13:DoCleaning();
            end;
        end, {});

        u14 = function(p17) -- Line: 60
            -- upvalues: u5 (copy)
            local v18 = u5.CenterWorldPosition + Vector3.new(-u5.WorldSize.X / 2, 0, -u5.WorldSize.Z / 2);
            local v19 = math.clamp((p17.X - v18.X) / u5.WorldSize.X, 0, 1);
            local v20 = math.clamp((p17.Z - v18.Z) / u5.WorldSize.Z, 0, 1);

            return UDim2.fromScale(v19, v20);
        end;

        local v21 = {
            DisplayOrder = 20,
            ResetOnSpawn = false
        };
        local v22 = {};
        local _ = #v22;
        local v23 = {
            BackgroundTransparency = 0.5,
            LayoutOrder = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(1, 0),
            AnchorPoint = Vector2.new(1, 0),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.fromOffset(u5.MinimapWidth, u5.MinimapWidth)
        };
        local v24 = {
            u2.createElement("UIStroke", {
                Thickness = 1,
                Transparency = 0.5,
                Color = Color3.fromRGB(255, 255, 255)
            }),
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }),
            PlayerPositionIndicator = u2.createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 155,
                Position = v7,
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
                    Rotation = v9
                })
            })
        };
        local v25 = #v24;
        local v26;

        if u5.TreasureModel == nil then
            v26 = false;
        else
            v26 = u2.createFragment({
                TreasureMapIndicator = u2.createElement("Frame", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 150,
                    Position = v11,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(224, 209, 43),
                    Size = UDim2.fromScale(0.1, 0.1)
                }, {
                    TreasurePositionIndicatorImage = u2.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        ImageTransparency = 0.1,
                        ZIndex = 151,
                        Size = UDim2.fromScale(1, 1),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Image = BedwarsImageId.X,
                        ImageColor3 = Color3.fromRGB(255, 0, 0)
                    })
                })
            });
        end;

        if v26 then
            v24[v25 + 1] = v26;
        end;

        v22.Background = u2.createElement("Frame", v23, v24);

        return u2.createElement("ScreenGui", v21, v22);
    end)
};