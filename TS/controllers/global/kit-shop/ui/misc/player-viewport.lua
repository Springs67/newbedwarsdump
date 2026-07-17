-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "device-util").DeviceUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local TweenService = v5.TweenService;
local AccessoriesCovered = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").AccessoriesCovered;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;

local function applyPreviewAccessoryTintToTaggedAccessories(p6, u7) -- Line: 17
    -- upvalues: ReplicatedStorage (copy)
    local ArmorTrims = ReplicatedStorage.Assets.ArmorTrims;

    for _, descendant in p6:GetDescendants() do
        if descendant:IsA("Accessory") and (descendant:GetAttribute("PlayerViewportPreviewAccessory") == true and ArmorTrims:FindFirstChild(descendant.Name, true) ~= nil) then
            local function _(p8) -- Line: 22
                -- upvalues: u7 (copy)
                if p8:IsA("BasePart") then
                    p8.Color = u7;
                end;
            end;

            for i, descendant2 in descendant:GetDescendants() do
                local _ = i - 1;

                if descendant2:IsA("BasePart") then
                    descendant2.Color = u7;
                end;
            end;
        end;
    end;
end;

return {
    PlayerViewport = v4.new(u3)(function(u9, p10) -- Line: 33
        -- upvalues: u3 (copy), u2 (copy), Players (copy), KnitClient (copy), CollectionService (copy), DeviceUtil (copy), ReplicatedStorage (copy), WeldUtil (copy), u1 (copy), AccessoriesCovered (copy), applyPreviewAccessoryTintToTaggedAccessories (copy), TweenService (copy)
        local useEffect = p10.useEffect;
        local useBinding = p10.useBinding;
        local u11 = u3.createRef();
        local u12, _ = useBinding(u3.createRef());
        local u13 = nil;

        local function u54() -- Line: 39
            -- upvalues: u11 (copy), u2 (ref), Players (ref), KnitClient (ref), CollectionService (ref), DeviceUtil (ref), ReplicatedStorage (ref), u9 (copy), WeldUtil (ref), u1 (ref), AccessoriesCovered (ref), applyPreviewAccessoryTintToTaggedAccessories (ref), u12 (copy), u13 (ref)
            local v14 = u11:getValue();

            if v14 == nil then
                return nil;
            end;

            local Kit = v14:FindFirstChild("Kit");

            if Kit ~= nil then
                Kit:Destroy();
            end;

            local u15 = u2("WorldModel", {
                Name = "Kit",
                Parent = v14
            });
            local u18 = (function() -- Line: 52
                -- upvalues: Players (ref), KnitClient (ref), CollectionService (ref), DeviceUtil (ref), ReplicatedStorage (ref)
                local u16 = nil;
                local LocalPlayer = Players.LocalPlayer;

                if LocalPlayer ~= nil then
                    LocalPlayer = LocalPlayer.Character;
                end;

                if LocalPlayer == nil then
                    if DeviceUtil.isHoarceKat() then
                        u16 = ReplicatedStorage.Assets.BaseR15Rig;

                        if u16 ~= nil then
                            u16 = u16:Clone();
                        end;
                    end;
                else
                    Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart");
                    Players.LocalPlayer.Character.Archivable = true;
                    u16 = KnitClient.Controllers.CharacterTransparencyController:getCharacterWithoutModifiers(Players.LocalPlayer.Character);

                    local function _(p17) -- Line: 63
                        -- upvalues: u16 (ref), CollectionService (ref)
                        if u16 then
                            CollectionService:RemoveTag(u16, p17);
                        end;
                    end;

                    for i, v in CollectionService:GetTags(u16) do
                        local _ = i - 1;

                        if u16 then
                            CollectionService:RemoveTag(u16, v);
                        end;
                    end;
                end;

                return u16;
            end)();

            if not u18 then
                return nil;
            end;

            local function _(p19) -- Line: 101
                if p19:IsA("BasePart") then
                    p19.Anchored = false;
                end;

                local v20 = p19:GetAttribute("DisableInPlayerViewport");

                if v20 ~= 0 and (v20 == v20 and (v20 ~= "" and v20)) then
                    p19:Destroy();
                end;
            end;

            for i, descendant in u18:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    descendant.Anchored = false;
                end;

                local v21 = descendant:GetAttribute("DisableInPlayerViewport");

                if v21 ~= 0 and (v21 == v21 and (v21 ~= "" and v21)) then
                    descendant:Destroy();
                end;
            end;

            local function _(p22) -- Line: 114
                if p22:IsA("LocalScript") then
                    p22:Destroy();
                end;
            end;

            for i, descendant in u18:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("LocalScript") then
                    descendant:Destroy();
                end;
            end;

            local Animation = u9.Animation;

            if Animation ~= "" and Animation then
                u18.AncestryChanged:Connect(function(p23, p24) -- Line: 124
                    -- upvalues: u18 (ref), u2 (ref), u9 (ref)
                    if p24 ~= nil and p24:IsDescendantOf(game) then
                        local v25 = u18;

                        if v25 ~= nil then
                            v25 = v25:FindFirstChild("Humanoid");

                            if v25 ~= nil then
                                v25 = v25:FindFirstChild("Animator");
                            end;
                        end;

                        if not v25 then
                            local v26 = {};
                            local v27 = u18;

                            if v27 ~= nil then
                                v27 = v27:FindFirstChild("Humanoid");
                            end;

                            v26.Parent = v27;
                            v25 = u2("Animator", v26);
                        end;

                        local v28 = v25:LoadAnimation(u2("Animation", {
                            AnimationId = u9.Animation
                        }));

                        if u9.AnimationSpeed ~= nil then
                            v28:AdjustSpeed(u9.AnimationSpeed);
                        end;

                        v28.Looped = true;
                        v28:Play();
                    end;
                end);
            end;

            task.defer(function() -- Line: 155
                -- upvalues: u18 (ref), u15 (copy), u9 (ref), ReplicatedStorage (ref), WeldUtil (ref), u1 (ref), AccessoriesCovered (ref), applyPreviewAccessoryTintToTaggedAccessories (ref), u12 (ref), u13 (ref)
                if not u18 then
                    return nil;
                end;

                u18.Name = "Kit";
                u18.Parent = u15;

                if u18.PrimaryPart then
                    u18:PivotTo(CFrame.new() * CFrame.Angles(0, -0.3490658503988659, 0));
                else
                    warn("No primary part found when mounting kit model. Are your assets out of date?");
                end;

                if u9.PreviewItemTypes then
                    for _, v in u9.PreviewItemTypes do
                        local Items = ReplicatedStorage:FindFirstChild("Items");

                        if Items ~= nil then
                            Items = Items:FindFirstChild(v);

                            if Items ~= nil then
                                Items = Items:Clone();
                            end;
                        end;

                        if Items then
                            Items.Parent = u18;
                        end;
                    end;

                    WeldUtil:weldCharacterAccessories(u18);
                end;

                if u9.PreviewAccessories then
                    local u29 = {};

                    for _, v in u9.PreviewAccessories do
                        local v30 = v:Clone();

                        if v30 then
                            v30:SetAttribute("PlayerViewportPreviewAccessory", true);
                            v30.Parent = u18;
                        end;

                        local u31 = {};
                        local v32 = u1.values(AccessoriesCovered);

                        local function v35(p33) -- Line: 195
                            -- upvalues: u31 (copy)
                            local function _(p34) -- Line: 197
                                -- upvalues: u31 (ref)
                                table.insert(u31, p34);
                            end;

                            for i, v2 in p33 do
                                local _ = i - 1;
                                table.insert(u31, v2);
                            end;
                        end;

                        for i, v2 in v32 do
                            v35(v2, i - 1, v32);
                        end;

                        local Handle = v:FindFirstChild("Handle");
                        local u36;

                        if Handle == nil then
                            u36 = Handle;
                        else
                            u36 = Handle:FindFirstChildOfClass("Attachment");
                        end;

                        if Handle and u36 then
                            local function v40(p37) -- Line: 215
                                -- upvalues: u31 (copy), u36 (copy)
                                for _, v2 in u31 do
                                    if p37 == v2 then
                                        local v38 = string.lower(u36.Name);
                                        local v39 = string.lower(v2);

                                        return string.match(v38, v39) ~= nil;
                                    end;
                                end;
                            end;

                            local v41 = 0;
                            local v42 = {};

                            for i, v2 in u31 do
                                if v40(v2, i - 1, u31) == true then
                                    v41 = v41 + 1;
                                    v42[v41] = v2;
                                end;
                            end;

                            local function _(p43) -- Line: 235
                                -- upvalues: u29 (copy)
                                u29[p43] = true;
                            end;

                            for i, v2 in v42 do
                                local _ = i - 1;
                                u29[v2] = true;
                            end;
                        end;
                    end;

                    WeldUtil:weldCharacterAccessories(u18);
                    local v44 = u18:FindFirstChildWhichIsA("Humanoid");

                    if v44 ~= nil then
                        v44 = v44:GetAccessories();
                    end;

                    for _, v in v44 == nil and {} or v44 do
                        local Handle = v:FindFirstChild("Handle");
                        local v45;

                        if Handle == nil then
                            v45 = Handle;
                        else
                            v45 = Handle:FindFirstChildOfClass("Attachment");
                        end;

                        if Handle and (v45 and (not ReplicatedStorage.Assets.Armor:FindFirstChild(v.Name, true) and (not ReplicatedStorage.Assets.ArmorTrims:FindFirstChild(v.Name, true) and v:GetAttribute("NoArmorHide") ~= true))) then
                            local v46 = false;

                            for i in u29 do
                                local v47 = string.lower(v45.Name);
                                local v48 = string.lower(i);
                                v46 = string.match(v47, v48) ~= nil;

                                if v46 then
                                    break;
                                end;
                            end;

                            if v46 then
                                v:Destroy();
                            end;
                        end;
                    end;

                    if u9.PreviewAccessoryTint ~= nil then
                        applyPreviewAccessoryTintToTaggedAccessories(u15, u9.PreviewAccessoryTint);
                    end;
                end;

                task.wait(0.01);
                local v49, v50 = u18:GetBoundingBox();
                local v51 = (math.max(v50.X, v50.Y, v50.Z) * -1 / 1.3 - 3) * 50;
                local Position = v49.Position;
                local v52 = Position + Vector3.new(0, 0.8 * 50, v51);
                local v53 = u12:getValue():getValue();

                if v53 then
                    v53.CFrame = CFrame.new(v52, Position);
                end;

                if u9.Rotate then
                    u13(u18);
                end;
            end);
        end;

        u13 = function(p55) -- Line: 320
            -- upvalues: TweenService (ref)
            if not p55.PrimaryPart then
                return nil;
            end;

            local v56 = TweenInfo.new(3, Enum.EasingStyle.Linear);
            local u57 = TweenService:Create(p55.PrimaryPart, v56, {
                CFrame = p55.PrimaryPart.CFrame * CFrame.Angles(0, 2.0943951023931953, 0)
            });
            local u58 = TweenService:Create(p55.PrimaryPart, v56, {
                CFrame = p55.PrimaryPart.CFrame * CFrame.Angles(0, 4.1887902047863905, 0)
            });
            local u59 = TweenService:Create(p55.PrimaryPart, v56, {
                CFrame = p55.PrimaryPart.CFrame * CFrame.Angles(0, 6.283185307179586, 0)
            });
            u57:Play();
            u57.Completed:Connect(function() -- Line: 350
                -- upvalues: u58 (copy)
                u58:Play();
            end);
            u58.Completed:Connect(function() -- Line: 353
                -- upvalues: u59 (copy)
                u59:Play();
            end);
            u59.Completed:Connect(function() -- Line: 356
                -- upvalues: u57 (copy)
                u57:Play();
            end);
        end;

        useEffect(function() -- Line: 360
            -- upvalues: u11 (copy), u12 (copy), u54 (copy)
            local v60 = u11:getValue();
            v60.Ambient = Color3.fromRGB(162, 162, 162);
            v60.LightColor = Color3.fromRGB(255, 255, 255);
            v60.LightDirection = Vector3.new(0, -1, 0);
            v60.CurrentCamera = u12:getValue():getValue();
            u54();
        end, {});
        useEffect(function() -- Line: 368
            -- upvalues: u54 (copy)
            u54();
        end, { u9.Animation, u9.Mode, u9.PreviewAccessories });
        useEffect(function() -- Line: 371
            -- upvalues: u9 (copy), u11 (copy), applyPreviewAccessoryTintToTaggedAccessories (ref)
            if u9.PreviewAccessoryTint == nil then
                return nil;
            end;

            local v61 = u11:getValue();

            if not v61 then
                return nil;
            end;

            local Kit = v61:FindFirstChild("Kit");

            if not Kit then
                return nil;
            end;

            task.defer(function() -- Line: 383
                -- upvalues: u9 (ref), applyPreviewAccessoryTintToTaggedAccessories (ref), Kit (copy)
                if u9.PreviewAccessoryTint == nil then
                    return nil;
                end;

                applyPreviewAccessoryTintToTaggedAccessories(Kit, u9.PreviewAccessoryTint);
            end);
        end, { u9.PreviewAccessoryTint });
        local v62 = {};

        for i, v in u9 do
            v62[i] = v;
        end;

        v62[u3.Children] = nil;
        v62.PreviewItemTypes = nil;
        v62.PreviewAccessories = nil;
        v62.PreviewAccessoryTint = nil;
        v62.Animation = nil;
        v62.AnimationSpeed = nil;
        v62.Rotate = nil;
        v62.Mode = nil;
        v62.Kit = nil;
        local v63 = {
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        };
        local BackgroundTransparency = u9.BackgroundTransparency;
        v63.BackgroundTransparency = BackgroundTransparency == nil and 1 or BackgroundTransparency;
        local ImageTransparency = u9.ImageTransparency;
        v63.ImageTransparency = ImageTransparency == nil and 0 or ImageTransparency;
        v63[u3.Ref] = u11;

        for i, v in v62 do
            v63[i] = v;
        end;

        local v64 = { u3.createElement("Camera", {
                FieldOfView = 1,
                [u3.Ref] = u12:getValue()
            }) };
        local v65 = #v64;
        local v66 = u9[u3.Children];

        if v66 then
            for i, v in v66 do
                if type(i) == "number" then
                    v64[v65 + i] = v;
                else
                    v64[i] = v;
                end;
            end;
        end;

        return u3.createFragment({
            PlayerViewport = u3.createElement("ViewportFrame", v63, v64)
        });
    end)
};