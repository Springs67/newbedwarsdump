local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.Players
local u10 = v7.ReplicatedStorage
local u11 = v7.RunService
local u12 = v7.Workspace
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, script.Parent.Parent, "bedwars", "maps", "map-knit-controller").MapKnitController
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "HalloweenPlatformController"
    end,
    ["__index"] = u16
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p20, { "Halloween-Map-2025" })
    p20.Name = "HalloweenPlatformController"
    p20.isOnPlatform = false
    p20.hasSpeedException = false
end
function u17.KnitStart(p21) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.KnitStart(p21)
end
function u17.onMapInit(_) --[[ Line: 41 ]] end
function u17.onMatchStart(u22) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u9
        [3] = u12
        [4] = u13
        [5] = u8
        [6] = u14
        [7] = u4
        [8] = u10
        [9] = u6
        [10] = u3
        [11] = u15
    --]]
    u11.Heartbeat:Connect(function() --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u12
            [3] = u13
            [4] = u8
            [5] = u22
            [6] = u14
        --]]
        local v23 = u9.LocalPlayer.Character
        if v23 and v23.PrimaryPart then
            local v24 = v23.PrimaryPart
            local v25 = RaycastParams.new()
            v25.FilterType = Enum.RaycastFilterType.Exclude
            v25.FilterDescendantsInstances = { v23 }
            local v26 = u12
            local v27 = v24.CFrame.Position
            local v28 = -u13 * 5
            local v29 = v26:Raycast(v27, Vector3.new(0, v28, 0), v25)
            if v29 ~= nil then
                v29 = v29.Instance
            end
            if v29 and u8:HasTag(v29, "moving-platform") then
                if u22.lastPlatformCFrame == nil then
                    u22.lastPlatformCFrame = v29.CFrame
                    u22.isOnPlatform = true
                    if not u22.hasSpeedException and u14.Client:Get("RequestPlatformSpeedException"):CallServer() then
                        u22.hasSpeedException = true
                    end
                end
                local v30 = v29.CFrame
                local v31 = v24.Position
                local v32 = v29.Position
                local v33 = v29.Size
                local v34 = v31.X - v32.X
                local v35 = math.abs(v34)
                local v36 = v31.Z - v32.Z
                local v37 = math.abs(v36)
                local v38
                if v35 <= v33.X / 2 and v37 <= v33.Z / 2 then
                    v38 = v31.Y > v32.Y + v33.Y / 2
                else
                    v38 = false
                end
                if v38 then
                    if u22.lastPlatformCFrame then
                        v24.CFrame = v30 * u22.lastPlatformCFrame:Inverse() * v24.CFrame
                    end
                    u22.lastPlatformCFrame = v29.CFrame
                else
                    local v39 = v31 - v32
                    local v40 = v39.X
                    local v41 = v39.Z
                    local v42 = Vector3.new(v40, 0, v41)
                    if v42.Magnitude > 0 then
                        local v43 = v32 + v42.Unit * (v33.X / 2 + 2)
                        local v44 = v43.X
                        local v45 = v31.Y
                        local v46 = v43.Z
                        local v47 = Vector3.new(v44, v45, v46)
                        local v48 = v24.AssemblyLinearVelocity
                        local v49 = (v47 - v31) * 10
                        local v50 = v49.X
                        local v51 = v48.Y
                        local v52 = v49.Z
                        v24.AssemblyLinearVelocity = Vector3.new(v50, v51, v52)
                    end
                    u22.lastPlatformCFrame = nil
                    u22.isOnPlatform = false
                    u22.hasSpeedException = false
                end
            else
                if u22.isOnPlatform then
                    u22.lastPlatformCFrame = nil
                    u22.isOnPlatform = false
                    u22.hasSpeedException = false
                end
                return
            end
        else
            return nil
        end
    end)
    u4("moving-platform", function(p53) --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u6
            [3] = u3
            [4] = u15
            [5] = u13
        --]]
        p53.Color = Color3.fromRGB(70, 255, 187)
        p53.Transparency = 0.5
        p53.Material = Enum.Material.Neon
        u10.Assets.Effects.VoidSmokeParticle:Clone().Parent = p53
        u6("PointLight", {
            ["Range"] = 16,
            ["Parent"] = p53,
            ["Color"] = u3.WHITE
        })
        u6("Sound", {
            ["Volume"] = 0.4,
            ["Looped"] = true,
            ["Playing"] = true,
            ["Parent"] = p53,
            ["SoundId"] = u15.GHOST_ORB_ACTIVE_LOOPED,
            ["RollOffMaxDistance"] = u13 * 10
        })
    end)
end
v5.CreateController(u17.new())
return nil