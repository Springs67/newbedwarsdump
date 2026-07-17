-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local SlideIn = v1.SlideIn;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v6.Players;
local RunService = v6.RunService;
local UserInputService = v6.UserInputService;
local Workspace = v6.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BedPlatingUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil;
local teamBuffMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "snake-shrine-buff", "team-buff-meta").teamBuffMeta;
local TEAM_BUFF_TYPES_ORDERED_BY_CATEGORY = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "snake-shrine-buff", "team-buff-type").TEAM_BUFF_TYPES_ORDERED_BY_CATEGORY;
local SnakeShrineUpgradeDescriptions = RuntimeLib.import(script, script.Parent, "snake-shrine-upgrade-descriptions").SnakeShrineUpgradeDescriptions;
local SnakeShrineUpgradeFrame = RuntimeLib.import(script, script.Parent, "snake-shrine-upgrade-frame").SnakeShrineUpgradeFrame;
local v55 = v4.new(u3)(function(u7, p8) -- Line: 28
    -- upvalues: DeviceUtil (copy), ClientStore (copy), TEAM_BUFF_TYPES_ORDERED_BY_CATEGORY (copy), BedPlatingUtil (copy), u2 (copy), Players (copy), Workspace (copy), default (copy), Linear (copy), RunService (copy), UserInputService (copy), Flamework (copy), BedwarsAppIds (copy), u3 (copy), DarkBackground (copy), ColorUtil (copy), teamBuffMeta (copy), SnakeShrineUpgradeFrame (copy), AutoCanvasScrollingFrame (copy), SnakeShrineUpgradeDescriptions (copy), SlideIn (copy)
    local useState = p8.useState;
    local useEffect = p8.useEffect;
    local v9 = DeviceUtil.isSmallScreen();
    local myTeam = ClientStore:getState().Game.myTeam;

    if myTeam ~= nil then
        myTeam = myTeam.id;
    end;

    local u10, u11 = useState(TEAM_BUFF_TYPES_ORDERED_BY_CATEGORY[1]);

    local function _(p12, p13) -- Line: 38
        -- upvalues: BedPlatingUtil (ref)
        return p12 == nil and true or p13[p12] == BedPlatingUtil.BedStatus.BED_BROKEN;
    end;

    local teamBedStatus = ClientStore:getState().Bedwars.teamBedStatus;
    local u14, u15 = useState(myTeam == nil and true or teamBedStatus[myTeam] == BedPlatingUtil.BedStatus.BED_BROKEN);

    local function u17(p16) -- Line: 42
        -- upvalues: u11 (copy)
        u11(p16);
    end;

    useEffect(function() -- Line: 45
        -- upvalues: u2 (ref), Players (ref), u7 (copy), Workspace (ref), default (ref), Linear (ref), RunService (ref), UserInputService (ref), Flamework (ref), BedwarsAppIds (ref), ClientStore (ref), myTeam (copy), BedPlatingUtil (ref), u15 (copy)
        local u18 = u2.new();
        local u19 = true;
        u18:GiveTask(function() -- Line: 48
            -- upvalues: u19 (ref)
            u19 = false;

            return u19;
        end);

        if not Players.LocalPlayer then
            return nil;
        end;

        local Character = Players.LocalPlayer.Character;
        local v20;

        if Character == nil then
            v20 = Character;
        else
            v20 = Character.PrimaryPart;
        end;

        if v20 then
            local Position = u7.SnakeShrineInstance.Position;
            local u21 = Vector3.new(Position.X, Character.PrimaryPart.Position.Y, Position.Z);
            Character:PivotTo(CFrame.new(Character.PrimaryPart.Position, u21));
            local CurrentCamera = Workspace.CurrentCamera;

            if CurrentCamera then
                local u22 = NumberRange.new(0.5, 14);
                local Magnitude = (CurrentCamera.CFrame.Position - (Character.PrimaryPart.Position + Vector3.new(0, 1.5, 0))).Magnitude;
                u18:GiveTask(function() -- Line: 73
                    -- upvalues: Players (ref), default (ref), Linear (ref), Magnitude (copy), u22 (copy)
                    Players.LocalPlayer.CameraMinZoomDistance = 6;
                    Players.LocalPlayer.CameraMaxZoomDistance = 6;
                    task.spawn(function() -- Line: 77
                        -- upvalues: default (ref), Linear (ref), Players (ref), Magnitude (ref), u22 (ref)
                        default(0.3, Linear, function(p23) -- Line: 78
                            -- upvalues: Players (ref), Magnitude (ref)
                            Players.LocalPlayer.CameraMinZoomDistance = p23 * Magnitude + (1 - p23) * 6;
                            Players.LocalPlayer.CameraMaxZoomDistance = p23 * Magnitude + (1 - p23) * 6;
                        end):Wait();
                        Players.LocalPlayer.CameraMinZoomDistance = u22.Min;
                        Players.LocalPlayer.CameraMaxZoomDistance = u22.Max;
                    end);
                end);
                RunService:BindToRenderStep("SnakeShrineCameraPosition", Enum.RenderPriority.Camera.Value + 2, function() -- Line: 89
                    -- upvalues: Character (copy), CurrentCamera (copy), u18 (copy), UserInputService (ref), u21 (ref), u7 (ref)
                    if not (Character.PrimaryPart and CurrentCamera.Parent) then
                        return u18:DoCleaning();
                    end;

                    UserInputService.MouseBehavior = Enum.MouseBehavior.Default;
                    local PrimaryPart = Character.PrimaryPart;

                    if PrimaryPart ~= nil then
                        PrimaryPart = PrimaryPart.Position;
                    end;

                    local v24 = u21 - PrimaryPart;
                    local Unit = v24:Cross(Vector3.new(0, 1, 0)).Unit;
                    local v25 = Character.PrimaryPart.Position - v24.Unit * 1.5 + Unit * 6;
                    local v26 = Vector3.new(0, u7.SnakeShrineInstance.Position.Y, 0);
                    CurrentCamera.CFrame = CFrame.new(v25 * Vector3.new(1, 0, 1) + (v26 + Vector3.new(0, 4, 0)), u7.SnakeShrineInstance.Position + Vector3.new(0, 1, 0));
                end);
                u18:GiveTask(function() -- Line: 115
                    -- upvalues: RunService (ref)
                    return RunService:UnbindFromRenderStep("SnakeShrineCameraPosition");
                end);
            end;
        end;

        local u27 = u7.SnakeShrineInstance:FindFirstChildWhichIsA("ProximityPrompt");
        u27 = u27;
        local v28;

        if u27 == nil then
            v28 = u27;
        else
            v28 = u27.Enabled;
        end;

        if v28 then
            u27.Enabled = false;
            u18:GiveTask(function() -- Line: 128
                -- upvalues: u27 (copy)
                u27.Enabled = true;

                return u27.Enabled;
            end);
        end;

        RunService:BindToRenderStep("SnakeShrineFirstPerson", Enum.RenderPriority.Character.Value + 1, function() -- Line: 135
            -- upvalues: Players (ref), UserInputService (ref)
            local Character2 = Players.LocalPlayer.Character;
            local v29;

            if Character2 == nil then
                v29 = Character2;
            else
                v29 = Character2.PrimaryPart;
            end;

            if not v29 then
                return nil;
            end;

            UserInputService.MouseBehavior = Enum.MouseBehavior.Default;

            local function _(p30) -- Line: 146
                if p30:IsA("BasePart") then
                    p30.LocalTransparencyModifier = 0;
                end;
            end;

            for i, descendant in Character2:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    descendant.LocalTransparencyModifier = 0;
                end;
            end;
        end);
        u18:GiveTask(function() -- Line: 155
            -- upvalues: RunService (ref)
            return RunService:UnbindFromRenderStep("SnakeShrineFirstPerson");
        end);
        task.delay(0.1, function() -- Line: 158
            -- upvalues: Character (copy), u19 (ref), u18 (copy), Flamework (ref), BedwarsAppIds (ref)
            local v31 = Character;

            if v31 ~= nil then
                v31 = v31:FindFirstChildWhichIsA("Humanoid");
            end;

            if u19 and v31 then
                u18:GiveTask(v31:GetPropertyChangedSignal("MoveDirection"):Connect(function() -- Line: 165
                    -- upvalues: Flamework (ref), BedwarsAppIds (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.SNAKE_SHRINE);
                end));
            end;
        end);
        task.delay(0.1, function() -- Line: 170
            -- upvalues: Character (copy), u19 (ref), Flamework (ref), BedwarsAppIds (ref)
            local v32 = Character;

            if v32 ~= nil then
                v32 = v32.PrimaryPart;

                if v32 ~= nil then
                    v32 = v32.Position;
                end;
            end;

            if not v32 then
                return nil;
            end;

            while true do
                local v33 = task.wait(0.05);

                if v33 ~= 0 and (v33 == v33 and v33) then
                    v33 = u19;
                end;

                if v33 == 0 or (v33 ~= v33 or not v33) then
                    return;
                end;

                local PrimaryPart = Character.PrimaryPart;

                if PrimaryPart ~= nil then
                    PrimaryPart = PrimaryPart.Position;
                end;

                if not PrimaryPart then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.SNAKE_SHRINE);

                    return nil;
                end;

                if ((PrimaryPart - v32) * Vector3.new(1, 0.3, 1)).Magnitude > 1 then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.SNAKE_SHRINE);

                    return nil;
                end;
            end;
        end);
        local u37 = ClientStore.changed:connect(function(p34, p35) -- Line: 207
            -- upvalues: myTeam (ref), BedPlatingUtil (ref), u15 (ref)
            local v36 = myTeam;

            if v36 ~= "" and v36 then
                v36 = p34.Bedwars.teamBedStatus[myTeam] == BedPlatingUtil.BedStatus.BED_BROKEN;
            end;

            if v36 ~= "" and v36 then
                u15(true);
            end;
        end);
        u18:GiveTask(function() -- Line: 216
            -- upvalues: u37 (copy)
            return u37:disconnect();
        end);

        return function() -- Line: 219
            -- upvalues: u18 (copy)
            u18:DoCleaning();
        end;
    end, {});
    local v38 = {
        ResetOnSpawn = false,
        DisplayOrder = 20,
        IgnoreGuiInset = not DeviceUtil.isSmallScreen()
    };
    local v39 = { u3.createElement(DarkBackground, {
            BackgroundTransparency = 0.9,
            AppId = u7.AppId
        }) };
    local v40 = {};
    local createElement = u3.createElement;
    local v41 = {};
    local v42;

    if v9 then
        v42 = UDim.new(0.05);
    else
        v42 = UDim.new(0.15);
    end;

    v41.PaddingLeft = v42;
    local v43;

    if v9 then
        v43 = UDim.new(0.05);
    else
        v43 = UDim.new(0.15);
    end;

    v41.PaddingRight = v43;
    v41.PaddingTop = UDim.new(0.1);
    v41.PaddingBottom = UDim.new(0.1);
    v40[1], v40[2] = createElement("UIPadding", v41), u3.createElement("UIListLayout", {
    FillDirection = Enum.FillDirection.Horizontal,
    HorizontalAlignment = Enum.HorizontalAlignment.Left,
    VerticalAlignment = Enum.VerticalAlignment.Center,
    SortOrder = Enum.SortOrder.LayoutOrder,
    HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
});
    local v44 = {
        BackgroundTransparency = 1,
        LayoutOrder = 0,
        AnchorPoint = Vector2.new(0, 0)
    };
    local v45;

    if v9 then
        v45 = UDim2.fromScale(0.03, 0.4);
    else
        v45 = UDim2.fromScale(0.2, 0.25);
    end;

    v44.Position = v45;
    v44.Size = UDim2.fromScale(0.2, 1);
    local v46 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8)
        }), u3.createElement("TextLabel", {
            AutomaticSize = "Y",
            BackgroundTransparency = 1,
            Text = "SELECT A BUFF",
            TextStrokeTransparency = 0,
            LayoutOrder = 0,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromScale(0.8, 0),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            TextColor3 = ColorUtil.WHITE,
            TextSize = v9 and 14 or 18,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        }) };

    local function _(p47) -- Line: 284
        -- upvalues: teamBuffMeta (ref), u14 (copy)
        return not (teamBuffMeta[p47].disableOnBedBreak and u14);
    end;

    local v48 = 0;
    local v49 = {};

    for i, v in TEAM_BUFF_TYPES_ORDERED_BY_CATEGORY do
        local _ = i - 1;

        if not (teamBuffMeta[v].disableOnBedBreak and u14) == true then
            v48 = v48 + 1;
            v49[v48] = v;
        end;
    end;

    local function _(p50) -- Line: 297
        -- upvalues: u3 (ref), SnakeShrineUpgradeFrame (ref), u10 (copy), u17 (copy)
        return u3.createElement(SnakeShrineUpgradeFrame, {
            SelectedBuff = u10,
            TeamBuffType = p50,
            OnClickedBuff = u17
        });
    end;

    local v51 = table.create(#v49);

    for i, v in v49 do
        local _ = i - 1;
        v51[i] = u3.createElement(SnakeShrineUpgradeFrame, {
            SelectedBuff = u10,
            TeamBuffType = v,
            OnClickedBuff = u17
        });
    end;

    local v52 = {
        ScrollingFrameProps = {
            LayoutOrder = 1,
            ScrollBarImageTransparency = 0.15,
            Size = UDim2.fromScale(1, 0.9),
            AutomaticCanvasSize = Enum.AutomaticSize.Y
        }
    };
    local v53 = { u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 2),
            PaddingLeft = UDim.new(0, 2),
            PaddingRight = UDim.new(0, 12)
        }), u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Left",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 6)
        }) };
    local v54 = #v53;

    for i, v in v51 do
        v53[v54 + i] = v;
    end;

    v46[#v46 + 1] = u3.createElement(AutoCanvasScrollingFrame, v52, v53);
    v40.TeamBuffList = u3.createElement("Frame", v44, v46);
    v40[#v40 + 1] = u3.createElement(SnakeShrineUpgradeDescriptions, {
        SelectedTeamBuff = u10,
        FrameProps = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.4, 0.4)
        }
    });
    v39[#v39 + 1] = u3.createElement(SlideIn, {}, v40);

    return u3.createFragment({
        SnakeShrineApp = u3.createElement("ScreenGui", v38, v39)
    });
end);

return {
    SnakeShrineApp = v5.connect(function(p56, p57) -- Line: 350
        local v58 = {};

        for i, v in p57 do
            v58[i] = v;
        end;

        v58.ObservedInventory = p56.Inventory.observedInventory;

        return v58;
    end)(v55)
};