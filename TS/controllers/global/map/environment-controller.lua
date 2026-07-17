-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GroupModifierBehavior = v1.GroupModifierBehavior;
local ModifierGroup = v1.ModifierGroup;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v6.Lighting;
local Workspace = v6.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "EnvironmentController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 26
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 30
    -- upvalues: KnitController (copy), u4 (copy), ModifierGroup (copy), Lighting (copy), u5 (copy), GroupModifierBehavior (copy)
    KnitController.constructor(p9);
    p9.Name = "EnvironmentController";
    p9.environmentMaid = u4.new();
    p9.colorCorrectionModifier = ModifierGroup.new(Lighting:FindFirstChildOfClass("ColorCorrectionEffect") or u5("ColorCorrectionEffect", {
        Parent = Lighting
    }), {
        baseProperties = {
            Contrast = 0.05,
            Saturation = 0,
            TintColor = Color3.fromRGB(255, 255, 255)
        },
        behavior = GroupModifierBehavior.Merge
    });
end;

function u7.KnitStart(p10) -- Line: 45
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p10);
end;

function u7.setupEnvironment(p11, p12, p13) -- Line: 48
    -- upvalues: u3 (copy), Workspace (copy), u5 (copy), Lighting (copy), KnitClient2 (copy)
    local v14 = p13 == nil and 10 or p13;
    p11.currentEnvironment = p12;
    p11.environmentMaid:DoCleaning();

    if p12.Terrain then
        for _, v in u3.entries(p12.Terrain) do
            local v15 = v[1];
            local v16 = v[2];

            if v15 == "MaterialColors" then
                for _, v3 in u3.entries(p12.Terrain.MaterialColors) do
                    Workspace.Terrain:SetMaterialColor(v3[1], v3[2]);
                end;
            else
                Workspace.Terrain[v15] = v16;
            end;
        end;
    end;

    if p12.Clouds then
        local v17 = Workspace.Terrain:GetChildren();
        local v18 = #v17 - 1;
        local v19 = false;

        while true do
            if true then
                if v19 then
                    v18 = v18 - 1;
                else
                    v19 = true;
                end;
            end;

            if v18 < 0 then
                break;
            end;

            local v20 = v17[v18 + 1];

            if v20:IsA("Clouds") then
                v20:Destroy();
            end;
        end;

        local environmentMaid = p11.environmentMaid;
        local v21 = {};

        for i, v in p12.Clouds do
            v21[i] = v;
        end;

        v21.Parent = Workspace.Terrain;
        environmentMaid:GiveTask(u5("Clouds", v21));
    end;

    if p12.BlurEffect then
        local environmentMaid = p11.environmentMaid;
        local v22 = {};

        for i, v in p12.BlurEffect do
            v22[i] = v;
        end;

        v22.Parent = Lighting;
        environmentMaid:GiveTask(u5("BlurEffect", v22));
    end;

    if p12.BloomEffect then
        local environmentMaid = p11.environmentMaid;
        local v23 = {};

        for i, v in p12.BloomEffect do
            v23[i] = v;
        end;

        v23.Parent = Lighting;
        environmentMaid:GiveTask(u5("BloomEffect", v23));
    end;

    if p12.DepthOfFieldEffect then
        local environmentMaid = p11.environmentMaid;
        local v24 = {};

        for i, v in p12.DepthOfFieldEffect do
            v24[i] = v;
        end;

        v24.Parent = Lighting;
        environmentMaid:GiveTask(u5("DepthOfFieldEffect", v24));
    end;

    local v25;

    if p12.ColorCorrectionEffect then
        local environmentMaid = p11.environmentMaid;
        local colorCorrectionModifier = p11.colorCorrectionModifier;
        v25 = v14;
        local v26 = {};

        for i, v in p12.ColorCorrectionEffect do
            v26[i] = v;
        end;

        environmentMaid:GiveTask(colorCorrectionModifier:addModifier(v14, v26));
    else
        v25 = v14;
    end;

    local v27;

    if p12.SunRaysEffect then
        local environmentMaid = p11.environmentMaid;
        local sunRayModifier = KnitClient2.Controllers.LightingController.sunRayModifier;
        v27 = v25;
        local v28 = {};

        for i, v in p12.SunRaysEffect do
            v28[i] = v;
        end;

        environmentMaid:GiveTask(sunRayModifier:addModifier(v25, v28));
    else
        v27 = v25;
    end;

    local v29;

    if p12.Sky then
        local environmentMaid = p11.environmentMaid;
        local skyModifier = KnitClient2.Controllers.LightingController.skyModifier;
        v29 = v27;
        local v30 = {};

        for i, v in p12.Sky do
            v30[i] = v;
        end;

        environmentMaid:GiveTask(skyModifier:addModifier(v27, v30));
    else
        v29 = v27;
    end;

    local v31;

    if p12.Lighting then
        local environmentMaid = p11.environmentMaid;
        local lightingModifier = KnitClient2.Controllers.LightingController.lightingModifier;
        v31 = v29;
        local v32 = {};

        for i, v in p12.Lighting do
            v32[i] = v;
        end;

        environmentMaid:GiveTask(lightingModifier:addModifier(v29, v32));
    else
        v31 = v29;
    end;

    if p12.Atmosphere then
        local environmentMaid = p11.environmentMaid;
        local v33 = KnitClient2.Controllers.LightingController:getAtmosphereModifier();
        local v34 = {};

        for i, v in p12.Atmosphere do
            v34[i] = v;
        end;

        environmentMaid:GiveTask(v33:addModifier(v31, v34));
    end;
end;

function u7.cleanupEnvironment(p35) -- Line: 175
    p35.environmentMaid:DoCleaning();
end;

function u7.enableLighting(p36, p37, p38) -- Line: 178
    -- upvalues: KnitClient2 (copy)
    local v39 = p38 == nil and 10 or p38;

    if p37.Lighting then
        local environmentMaid = p36.environmentMaid;
        local lightingModifier = KnitClient2.Controllers.LightingController.lightingModifier;
        local v40 = {};

        for i, v in p37.Lighting do
            v40[i] = v;
        end;

        environmentMaid:GiveTask(lightingModifier:addModifier(v39, v40));
    end;
end;

function u7.getCurrentEnvironment(p41) -- Line: 193
    return p41.currentEnvironment;
end;

KnitClient.CreateController(u7.new());

return nil;