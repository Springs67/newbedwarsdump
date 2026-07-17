-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local CFrameUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local _ = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "visual-debug-util").VisualDebugUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "MummyKillEffect";
    end,

    __index = KillEffect
});
u3.__index = u3;

function u3.new(...) -- Line: 34
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, p6) -- Line: 38
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p5, p6);
    KillEffect.setPlayDefaultKillEffect(p5, false);
end;

function u3.onKill(p7, p8, p9, p10) -- Line: 42
    -- upvalues: u1 (copy), u2 (copy), Workspace (copy), KillEffect (copy), SoundManager (copy), GameSound (copy), RuntimeLib (copy), BedwarsImageId (copy), default (copy), InQuad (copy), CFrameUtil (copy)
    local u11 = u1.new();
    local u12 = u2("Folder", {
        Name = "MummyKillEffect",
        Parent = Workspace
    });
    u11:GiveTask(u12);
    p9.Archivable = true;
    local u13 = p9:Clone();
    u13.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    u13.HumanoidRootPart.Anchored = true;
    u13:PivotTo(p10);
    u13.Parent = Workspace;
    KillEffect.hideCharacter(p7, p9);
    u11:GiveTask(u13);
    local u14 = RaycastParams.new();
    u14.FilterType = Enum.RaycastFilterType.Whitelist;
    u14.FilterDescendantsInstances = { u13 };
    local u15 = u13.HumanoidRootPart.Position + Vector3.new(0, -3, 0);
    local LookVector = u13.HumanoidRootPart.CFrame.LookVector;
    local RightVector = u13.HumanoidRootPart.CFrame.RightVector;
    local u16 = u13.HumanoidRootPart.CFrame.LookVector * -1;
    local u17 = u13.HumanoidRootPart.CFrame.RightVector * -1;
    local UpVector = u13.HumanoidRootPart.CFrame.UpVector;
    local u18 = u13.HumanoidRootPart.CFrame.UpVector * -1;
    local u19 = false;
    local u20 = false;
    local v21 = Color3.fromHex("#eae5ae");
    local u22 = ColorSequence.new(v21, v21);
    u11:GiveTask(SoundManager:playSound(GameSound.STRING_KILL_EFFECT, {
        rollOffMaxDistance = 150,
        rollOffMinDistance = 50,
        playbackSpeedMultiplier = 0.7,
        position = p10.Position
    }));
    local u56 = RuntimeLib.Promise.new(function() -- Line: 80
        -- upvalues: LookVector (copy), u15 (copy), u16 (copy), Workspace (ref), u14 (copy), u17 (copy), RightVector (copy), u2 (ref), u12 (copy), u11 (copy), u22 (copy), BedwarsImageId (ref), default (ref), InQuad (ref), u19 (ref)
        local v23 = 0;
        local v24 = {};
        local v25 = false;
        local v26, v27;

        while true do
            if v23 > 8 then
                v26 = false;
                v27 = 0;
                break;
            end;

            local v28 = nil;
            local v29 = nil;
            local v30 = nil;
            local v31 = nil;
            local v32 = u15 + (LookVector * 5 + Vector3.new(0, v23, 0));
            local v33 = u16;
            local v34 = Workspace:Blockcast(CFrame.new(v32, v32 + v33), Vector3.new(10, 0.5, 0.1), v33 * 20, u14);

            if v34 then
                v28 = v32 + v33 * (v34.Distance - 0.05);
                v25 = true;
            elseif v25 then
                v26 = false;
                v27 = 0;
                break;
            end;

            local v35 = u15 + (u16 * 5 + Vector3.new(0, v23, 0));
            local v36 = LookVector;
            local v37 = Workspace:Blockcast(CFrame.new(v35, v35 + v36), Vector3.new(10, 0.5, 0.1), v36 * 20, u14);

            if v37 then
                v29 = v35 + v36 * (v37.Distance - 0.05);
                v25 = true;
            elseif v25 then
                v26 = false;
                v27 = 0;
                break;
            end;

            local v38 = u15 + (u17 * 5 + Vector3.new(0, v23, 0));
            local v39 = RightVector;
            local v40 = Workspace:Blockcast(CFrame.new(v38, v38 + v39), Vector3.new(10, 0.5, 0.1), v39 * 20, u14);

            if v40 then
                v30 = v38 + v39 * (v40.Distance - 0.05);
                v25 = true;
            elseif v25 then
                v26 = false;
                v27 = 0;
                break;
            end;

            local v41 = u15 + (RightVector * 5 + Vector3.new(0, v23, 0));
            local v42 = u17;
            local v43 = Workspace:Blockcast(CFrame.new(v41, v41 + v42), Vector3.new(10, 0.5, 0.1), v42 * 20, u14);

            if v43 then
                v31 = v41 + v42 * (v43.Distance - 0.05);
                v25 = true;
            elseif v25 then
                v26 = false;
                v27 = 0;
                break;
            end;

            if v30 ~= nil then
                v30 = (v30 - (v31 or Vector3.new(0, 0, 0))).Magnitude;
            end;

            local v44 = v30 == nil and 0 or v30;
            local v45;

            if v28 == nil then
                v45 = v28;
            else
                v45 = (v28 - (v29 or Vector3.new(0, 0, 0))).Magnitude;
            end;

            local _ = v45 == nil and 0 or v45;
            local v46;

            if v28 == nil then
                v46 = v28;
            else
                v46 = v28 + u17 * (v44 / 2);
            end;

            if v28 ~= nil then
                v28 = v28 + RightVector * (v44 / 2);
            end;

            local v47;

            if v29 == nil then
                v47 = v29;
            else
                v47 = v29 + u17 * (v44 / 2);
            end;

            if v29 ~= nil then
                v29 = v29 + RightVector * (v44 / 2);
            end;

            table.insert(v24, v46 == nil and Vector3.new(0, 0, 0) or v46);
            table.insert(v24, v28 == nil and Vector3.new(0, 0, 0) or v28);
            table.insert(v24, v29 == nil and Vector3.new(0, 0, 0) or v29);
            table.insert(v24, v47 == nil and Vector3.new(0, 0, 0) or v47);
            v23 = v23 + 0.5;
        end;

        while true do
            if v26 then
                v27 = v27 + 1;
            else
                v26 = true;
            end;

            if v27 >= #v24 - 1 then
                u19 = true;

                return;
            end;

            local u48 = v24[v27 + 1];
            local u49 = v24[v27 + 1 + 1];

            if u48 ~= nil and u49 ~= nil then
                local v50 = u2("Part", {
                    Name = "MummyKillEffect_Part",
                    Size = Vector3.new(0.1, 0.1, 0.1),
                    Anchored = true,
                    CanCollide = false,
                    CanTouch = false,
                    CanQuery = false,
                    Transparency = 1,
                    Position = u48,
                    Parent = u12
                });
                u11:GiveTask(v50);
                local u51 = v50:Clone();
                u11:GiveTask(u51);
                u51.Parent = u12;
                local v52 = u2("Attachment", {
                    Parent = v50
                });
                u11:GiveTask(v52);
                local v53 = u2("Attachment", {
                    Parent = u51
                });
                u11:GiveTask(v53);
                u11:GiveTask((u2("Beam", {
                    Name = "MummyKillEffect_BandageBeam",
                    Width0 = 0.75,
                    Width1 = 0.75,
                    FaceCamera = false,
                    Segments = 2,
                    TextureSpeed = 0,
                    Attachment0 = v52,
                    Attachment1 = v53,
                    Transparency = NumberSequence.new(0),
                    Color = u22,
                    Parent = u12,
                    Texture = BedwarsImageId.MUMMY_BANDAGE_TEXTURE
                })));
                local u55 = default((u48 - u49).Magnitude / 60, InQuad, function(p54) -- Line: 358
                    -- upvalues: u51 (copy), u48 (copy), u49 (copy)
                    u51.Position = u48:Lerp(u49, p54);
                end, 0, 1);
                u11:GiveTask(function() -- Line: 361
                    -- upvalues: u55 (copy)
                    return u55:Cancel();
                end);
                u55:Play():Wait();
            end;
        end;
    end);
    u11:GiveTask(function() -- Line: 369
        -- upvalues: u56 (copy)
        return u56:cancel();
    end);
    local u99 = RuntimeLib.Promise.new(function() -- Line: 372
        -- upvalues: u13 (copy), u17 (copy), UpVector (copy), RightVector (copy), u18 (copy), CFrameUtil (ref), Workspace (ref), u14 (copy), LookVector (copy), u16 (copy), u2 (ref), u12 (copy), u11 (copy), u22 (copy), BedwarsImageId (ref), default (ref), InQuad (ref), u20 (ref)
        local v57 = u13.HumanoidRootPart.Position + u17 * 3;
        CFrame.new();
        local v58 = 0;
        local v59 = {};

        while v58 <= 6 do
            local v60 = v57 + (UpVector * 5 + RightVector * v58);
            local v61 = u18;
            local v62 = CFrameUtil.rotateCframeLocalDegrees(u13.HumanoidRootPart.CFrame, Vector3.new(-90, 0, 0));
            local v63 = Workspace:Blockcast(CFrameUtil.setCframePositionWithoutChangingRotation(v62, v60), Vector3.new(0.5, 10, 0.1), v61 * 20, u14);
            local v64 = not v63 and Vector3.new(0, 0, 0) or v60 + v61 * (v63.Distance - 0.03);
            local v65 = v57 + (u18 * 5 + RightVector * v58);
            local v66 = UpVector;
            local v67 = CFrameUtil.rotateCframeLocalDegrees(u13.HumanoidRootPart.CFrame, Vector3.new(-270, 0, 0));
            CFrameUtil.setCframePositionWithoutChangingRotation(v67, v65);
            local v68 = Workspace:Blockcast(CFrame.new(v65, v65 + v66), Vector3.new(0.5, 10, 0.1), v66 * 20, u14);
            local v69 = not v68 and Vector3.new(0, 0, 0) or v65 + v66 * (v68.Distance - 0.03);
            local v70 = v57 + (LookVector * 5 + RightVector * v58);
            local v71 = u16;
            local v72 = CFrameUtil.rotateCframeLocalDegrees(u13.HumanoidRootPart.CFrame, Vector3.new(0, 0, 0));
            CFrameUtil.setCframePositionWithoutChangingRotation(v72, v70);
            local v73 = Workspace:Blockcast(CFrame.new(v70, v70 + v71), Vector3.new(0.5, 10, 0.1), v71 * 20, u14);
            local v74 = not v73 and Vector3.new(0, 0, 0) or v70 + v71 * (v73.Distance - 0.03);
            local v75 = v57 + (u16 * 5 + RightVector * v58);
            local v76 = LookVector;
            local v77 = CFrameUtil.rotateCframeLocalDegrees(u13.HumanoidRootPart.CFrame, Vector3.new(-180, 0, 0));
            CFrameUtil.setCframePositionWithoutChangingRotation(v77, v75);
            local v78 = Workspace:Blockcast(CFrame.new(v75, v75 + v76), Vector3.new(0.5, 10, 0.1), v76 * 20, u14);
            local v79 = not v78 and Vector3.new(0, 0, 0) or v75 + v76 * (v78.Distance - 0.03);
            local v80;

            if v64 == nil then
                v80 = v64;
            else
                v80 = (v64 - (v69 or Vector3.new(0, 0, 0))).Magnitude;
            end;

            local _ = v80 == nil and 0 or v80;

            if v74 ~= nil then
                v74 = (v74 - (v79 or Vector3.new(0, 0, 0))).Magnitude;
            end;

            local v81 = v74 == nil and 0 or v74;
            local v82;

            if v64 == nil then
                v82 = v64;
            else
                v82 = v64 + LookVector * (v81 / 2);
            end;

            local v83 = v82 == nil and Vector3.new(0, 0, 0) or v82;

            if v64 ~= nil then
                v64 = v64 + u16 * (v81 / 2);
            end;

            local v84 = v64 == nil and Vector3.new(0, 0, 0) or v64;
            local v85;

            if v69 == nil then
                v85 = v69;
            else
                v85 = v69 + LookVector * (v81 / 2);
            end;

            local v86 = v85 == nil and Vector3.new(0, 0, 0) or v85;

            if v69 ~= nil then
                v69 = v69 + u16 * (v81 / 2);
            end;

            local v87 = v69 == nil and Vector3.new(0, 0, 0) or v69;

            if v83 ~= Vector3.new(0, 0, 0) then
                table.insert(v59, v83);
            end;

            if v84 ~= Vector3.new(0, 0, 0) then
                table.insert(v59, v84);
            end;

            if v87 ~= Vector3.new(0, 0, 0) then
                table.insert(v59, v87);
            end;

            if v86 ~= Vector3.new(0, 0, 0) then
                table.insert(v59, v86);
            end;

            v58 = v58 + 0.5;
        end;

        local v88 = false;
        local v89 = 0;

        while true do
            if v88 then
                v89 = v89 + 1;
            else
                v88 = true;
            end;

            if v89 >= #v59 then
                u20 = true;

                return;
            end;

            local u90 = v59[v89 + 1];
            local u91 = v59[v89 + 1 + 1];

            if u90 ~= nil and u91 ~= nil then
                local v92 = CFrame.new(u90, u91);
                local v93 = u2("Part", {
                    Name = "MummyKillEffect_Part",
                    Size = Vector3.new(0.1, 0.1, 0.1),
                    Anchored = true,
                    CanCollide = false,
                    CanTouch = false,
                    CanQuery = false,
                    Transparency = 1,
                    CFrame = CFrameUtil.rotateCframeLocalDegrees(v92, Vector3.new(0, 0, 90)),
                    Parent = u12
                });
                u11:GiveTask(v93);
                local u94 = v93:Clone();
                u94.Parent = u12;
                u11:GiveTask(u94);
                local v95 = u2("Attachment", {
                    Parent = v93
                });
                u11:GiveTask(v95);
                local v96 = u2("Attachment", {
                    Parent = u94
                });
                u11:GiveTask(v96);
                u11:GiveTask((u2("Beam", {
                    Name = "MummyKillEffect_BandageBeam",
                    Width0 = 0.75,
                    Width1 = 0.75,
                    FaceCamera = false,
                    Segments = 2,
                    TextureSpeed = 0,
                    Attachment0 = v95,
                    Attachment1 = v96,
                    Transparency = NumberSequence.new(0),
                    Color = u22,
                    Texture = BedwarsImageId.MUMMY_BANDAGE_TEXTURE,
                    Parent = u12
                })));
                local u98 = default((u90 - u91).Magnitude / 60, InQuad, function(p97) -- Line: 663
                    -- upvalues: u94 (copy), u90 (copy), u91 (copy)
                    u94.Position = u90:Lerp(u91, p97);
                end, 0, 1);
                u11:GiveTask(function() -- Line: 666
                    -- upvalues: u98 (copy)
                    return u98:Cancel();
                end);
                u98:Play():Wait();
            end;
        end;
    end);
    u11:GiveTask(function() -- Line: 674
        -- upvalues: u99 (copy)
        return u99:cancel();
    end);
    task.delay(10, function() -- Line: 677
        -- upvalues: u11 (copy)
        u11:DoCleaning();
    end);

    return u11;
end;

return u3;