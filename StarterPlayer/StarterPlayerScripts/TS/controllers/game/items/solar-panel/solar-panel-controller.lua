local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.RunService
local u9 = v7.TweenService
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "SolarPanelController"
    end,
    ["__index"] = u10
})
u13.__index = u13
function u13.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p16)
    p16.Name = "SolarPanelController"
end
function u13.KnitStart(p17) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u4
        [3] = u6
        [4] = u9
        [5] = u11
        [6] = u3
        [7] = u12
        [8] = u8
    --]]
    u10.KnitStart(p17)
    u4("SolarPanel", function(u18) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u9
            [3] = u11
            [4] = u3
            [5] = u12
            [6] = u8
        --]]
        local u19 = u6.new()
        local u20 = u18:WaitForChild("Generated").Inner
        local u21 = u18.Generated.Outer
        local u22 = u18.Fins.Frame:GetChildren()
        local v23 = 0
        local u24 = {}
        for v25, v27 in u20:GetDescendants() do
            local _ = v25 - 1
            if not v27:IsA("Beam") then
                local v27 = nil
            end
            if v27 ~= nil then
                v23 = v23 + 1
                u24[v23] = v27
            end
        end
        u20.Transparency = 1
        u21.Transparency = 1
        local u28 = u9:Create(u20, TweenInfo.new(u11.SOLAR_PANEL_RESOURCE_GEN_TIME), {
            ["Transparency"] = 0
        })
        local u29 = u9:Create(u21, TweenInfo.new(u11.SOLAR_PANEL_RESOURCE_GEN_TIME), {
            ["Transparency"] = 0
        })
        local u30 = 0
        u18:GetAttributeChangedSignal("Active"):Connect(function() --[[ Line: 74 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u24
                [3] = u30
                [4] = u28
                [5] = u29
                [6] = u22
                [7] = u9
                [8] = u11
                [9] = u3
                [10] = u12
                [11] = u20
                [12] = u21
            --]]
            local v31 = u18:GetAttribute("Active")
            for v32, v33 in u24 do
                local _ = v32 - 1
                v33.Enabled = v31
                local _ = v33.Enabled
            end
            if v31 then
                local v34 = u30 + 1
                u30 = v34
                u28:Play()
                u29:Play()
                for _, v35 in u22 do
                    if not u18:GetAttribute("Active") or u30 ~= v34 then
                        ::l9::
                        return
                    end
                    for _, v36 in v35:GetChildren() do
                        if v36:IsA("Beam") then
                            u9:Create(v36, TweenInfo.new(u11.SOLAR_PANEL_RESOURCE_GEN_TIME / 6), {
                                ["Brightness"] = 4,
                                ["TextureSpeed"] = v36.TextureSpeed * 1.25
                            }):Play()
                            v36.Enabled = v31
                        end
                        u3:playSound(u12.SOLAR_PANEL_ENERGY, {
                            ["position"] = u18.Position
                        })
                    end
                    task.wait(u11.SOLAR_PANEL_RESOURCE_GEN_TIME / 6)
                end
                return
            else
                if u28.PlaybackState == Enum.PlaybackState.Playing then
                    u28:Cancel()
                end
                if u29.PlaybackState == Enum.PlaybackState.Playing then
                    u29:Cancel()
                end
                u20.Transparency = 1
                u21.Transparency = 1
                for _, v37 in u22 do
                    for _, v38 in v37:GetChildren() do
                        if v38:IsA("Beam") then
                            v38.Enabled = v31
                            v38.Brightness = 2
                            v38.TextureSpeed = 0.6
                        end
                    end
                end
                goto l9
            end
        end)
        task.spawn(function() --[[ Line: 125 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u19
                [3] = u8
            --]]
            local u39 = u18.Fins
            local u40 = 0
            local u41 = u39:GetPivot()
            u19:GiveTask(u8.Heartbeat:Connect(function(p42) --[[ Line: 129 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u19
                    [3] = u40
                    [4] = u41
                    [5] = u39
                --]]
                if u18:GetAttribute("Active") == false then
                    return nil
                end
                if u18.Parent == nil then
                    u19:DoCleaning()
                    return nil
                end
                u40 = u40 + p42
                local v43 = CFrame.Angles
                local v44 = 12.566370614359172 * u40 / 2
                u39:PivotTo(u41 * v43(0, math.rad(v44), 0))
            end))
        end)
    end)
end
v5.CreateController(u13.new())
return nil