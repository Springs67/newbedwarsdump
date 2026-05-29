local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local v14 = {}
local u15 = setmetatable({}, {
    ["__index"] = v14
})
u15.NORMAL = 0
v14[0] = "NORMAL"
u15.SLICED = 1
v14[1] = "SLICED"
u15.SPIN = 2
v14[2] = "SPIN"
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "BreakBedEffectUtilController"
    end,
    ["__index"] = u11
})
u16.__index = u16
function u16.new(...) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u6
        [3] = u9
    --]]
    u11.constructor(p19)
    p19.Name = "BreakBedEffectUtilController"
    p19.bedMap = {}
    p19.bedFolder = u6("Folder", {
        ["Name"] = "BedModels",
        ["Parent"] = u9
    })
end
function u16.KnitStart(p20) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.KnitStart(p20)
end
function u16.createBedClone(_, p21, p22, p23) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u13
        [3] = u2
        [4] = u12
        [5] = u15
        [6] = u8
        [7] = u10
    --]]
    local u24 = u5.Controllers.TeamController:getTeamById(p21)
    if u24 ~= nil then
        u24 = u24.color
    end
    if u24 == nil then
        u24 = p23 or Color3.fromRGB(0, 0, 0)
    end
    if u13.isLobbyServer() and not p23 then
        u24 = u2.hexColor(u12.red)
    end
    local v25
    if p22 == u15.SLICED then
        v25 = u8.Assets.Misc.SlicedBed:Clone()
        local v26 = v25.Pivot.Align:GetChildren()
        local function v28(p27) --[[ Line: 79 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u2
                [3] = u24
            --]]
            if not p27:IsA("MeshPart") then
                return nil
            end
            if u10.includes(string.lower(p27.Name), "blanket") then
                p27.Color = u2.brighten(u24, 0.2)
                return nil
            end
            if u10.includes(string.lower(p27.Name), "mattress") then
                p27.Color = u24
            end
        end
        for v29, v30 in v26 do
            v28(v30, v29 - 1, v26)
        end
    elseif p22 == u15.SPIN then
        v25 = u8.Assets.Misc.SpinBed:Clone()
        v25.Root.Bed.Color = u24
        v25.Root.Blanket.Color = u2.brighten(u24, 0.2)
    else
        v25 = u8.Assets.Blocks.bed:Clone()
        v25.Root.Bed.Color = u24
        v25.Root.Blanket.Color = u2.brighten(u24, 0.2)
    end
    return v25
end
v4.CreateController(u16.new())
return {
    ["BedBreakBedType"] = u15
}