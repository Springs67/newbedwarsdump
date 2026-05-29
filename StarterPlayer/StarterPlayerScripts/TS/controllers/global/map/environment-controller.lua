local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GroupModifierBehavior
local u4 = v2.ModifierGroup
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Lighting
local u13 = v11.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "EnvironmentController"
    end,
    ["__index"] = u14
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u9
        [3] = u4
        [4] = u12
        [5] = u10
        [6] = u3
    --]]
    u14.constructor(p18)
    p18.Name = "EnvironmentController"
    p18.environmentMaid = u9.new()
    p18.colorCorrectionModifier = u4.new(u12:FindFirstChildOfClass("ColorCorrectionEffect") or u10("ColorCorrectionEffect", {
        ["Parent"] = u12
    }), {
        ["baseProperties"] = {
            ["Contrast"] = 0.05,
            ["Saturation"] = 0,
            ["TintColor"] = Color3.fromRGB(255, 255, 255)
        },
        ["behavior"] = u3.Merge
    })
end
function u15.KnitStart(p19) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.KnitStart(p19)
end
function u15.setupEnvironment(p20, p21, p22) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
        [3] = u10
        [4] = u12
        [5] = u7
    --]]
    local v23 = p22 == nil and 10 or p22
    p20.currentEnvironment = p21
    p20.environmentMaid:DoCleaning()
    if p21.Terrain then
        for _, v24 in u8.entries(p21.Terrain) do
            local v25 = v24[1]
            local v26 = v24[2]
            if v25 == "MaterialColors" then
                for _, v27 in u8.entries(p21.Terrain.MaterialColors) do
                    local v28 = v27[1]
                    local v29 = v27[2]
                    u13.Terrain:SetMaterialColor(v28, v29)
                end
            else
                u13.Terrain[v25] = v26
            end
        end
    end
    if p21.Clouds then
        local v30 = u13.Terrain:GetChildren()
        local v31 = #v30 - 1
        local v32 = false
        while true do
            if true then
                if v32 then
                    v31 = v31 - 1
                else
                    v32 = true
                end
            end
            if v31 < 0 then
                break
            end
            local v33 = v30[v31 + 1]
            if v33:IsA("Clouds") then
                v33:Destroy()
            end
        end
        local v34 = p20.environmentMaid
        local v35 = {}
        for v36, v37 in p21.Clouds do
            v35[v36] = v37
        end
        v35.Parent = u13.Terrain
        v34:GiveTask(u10("Clouds", v35))
    end
    if p21.BlurEffect then
        local v38 = p20.environmentMaid
        local v39 = {}
        for v40, v41 in p21.BlurEffect do
            v39[v40] = v41
        end
        v39.Parent = u12
        v38:GiveTask(u10("BlurEffect", v39))
    end
    if p21.BloomEffect then
        local v42 = p20.environmentMaid
        local v43 = {}
        for v44, v45 in p21.BloomEffect do
            v43[v44] = v45
        end
        v43.Parent = u12
        v42:GiveTask(u10("BloomEffect", v43))
    end
    if p21.DepthOfFieldEffect then
        local v46 = p20.environmentMaid
        local v47 = {}
        for v48, v49 in p21.DepthOfFieldEffect do
            v47[v48] = v49
        end
        v47.Parent = u12
        v46:GiveTask(u10("DepthOfFieldEffect", v47))
    end
    local v50
    if p21.ColorCorrectionEffect then
        local v51 = p20.environmentMaid
        local v52 = p20.colorCorrectionModifier
        v50 = v23
        local v53 = {}
        for v54, v55 in p21.ColorCorrectionEffect do
            v53[v54] = v55
        end
        v51:GiveTask(v52:addModifier(v23, v53))
    else
        v50 = v23
    end
    local v56
    if p21.SunRaysEffect then
        local v57 = p20.environmentMaid
        local v58 = u7.Controllers.LightingController.sunRayModifier
        v56 = v50
        local v59 = {}
        for v60, v61 in p21.SunRaysEffect do
            v59[v60] = v61
        end
        v57:GiveTask(v58:addModifier(v50, v59))
    else
        v56 = v50
    end
    local v62
    if p21.Sky then
        local v63 = p20.environmentMaid
        local v64 = u7.Controllers.LightingController.skyModifier
        v62 = v56
        local v65 = {}
        for v66, v67 in p21.Sky do
            v65[v66] = v67
        end
        v63:GiveTask(v64:addModifier(v56, v65))
    else
        v62 = v56
    end
    local v68
    if p21.Lighting then
        local v69 = p20.environmentMaid
        local v70 = u7.Controllers.LightingController.lightingModifier
        v68 = v62
        local v71 = {}
        for v72, v73 in p21.Lighting do
            v71[v72] = v73
        end
        v69:GiveTask(v70:addModifier(v62, v71))
    else
        v68 = v62
    end
    if p21.Atmosphere then
        local v74 = p20.environmentMaid
        local v75 = u7.Controllers.LightingController:getAtmosphereModifier()
        local v76 = {}
        for v77, v78 in p21.Atmosphere do
            v76[v77] = v78
        end
        v74:GiveTask(v75:addModifier(v68, v76))
    end
end
function u15.cleanupEnvironment(p79) --[[ Line: 175 ]]
    p79.environmentMaid:DoCleaning()
end
function u15.enableLighting(p80, p81, p82) --[[ Line: 178 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v83 = p82 == nil and 10 or p82
    if p81.Lighting then
        local v84 = p80.environmentMaid
        local v85 = u7.Controllers.LightingController.lightingModifier
        local v86 = {}
        for v87, v88 in p81.Lighting do
            v86[v87] = v88
        end
        v84:GiveTask(v85:addModifier(v83, v86))
    end
end
function u15.getCurrentEnvironment(p89) --[[ Line: 193 ]]
    return p89.currentEnvironment
end
v6.CreateController(u15.new())
return nil