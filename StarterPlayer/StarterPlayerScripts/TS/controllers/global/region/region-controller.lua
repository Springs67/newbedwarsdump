local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").LobbyEvents
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u11 = u1.import(script, script.Parent, "ui", "region-button").QueueRegionButton
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "RegionController"
    end,
    ["__index"] = u7
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p15)
    p15.Name = "RegionController"
end
function u12.KnitStart(u16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u10
        [3] = u1
        [4] = u9
        [5] = u8
        [6] = u4
    --]]
    u7.KnitStart(u16)
    if u10.isGameServer() then
        u1.Promise.defer(function() --[[ Line: 34 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u8
                [3] = u16
            --]]
            u9.Client:WaitFor("FetchServerRegion"):andThen(function(p17) --[[ Line: 36 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u16
                --]]
                local v18 = p17:CallServer()
                u8:dispatch({
                    ["type"] = "SetServerRegion",
                    ["serverRegion"] = v18
                })
                u16:mountServerRegionDisplay(v18)
            end)
        end)
    elseif u10.isLobbyServer() then
        u4.client.deviceInfoUpdate:connect(function(p19) --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            if p19.deviceInfo then
                u16:mountQueueRegionDisplay(p19.deviceInfo)
            end
        end)
    end
end
function u12.mountServerRegionDisplay(_, p20) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u6
    --]]
    local v21 = u5.mount
    local v22 = u5.createFragment
    local v23 = {}
    local v24 = u5.createElement
    local v25 = {
        ["ServerRegionText"] = u5.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["TextTransparency"] = 0.4,
            ["AnchorPoint"] = Vector2.new(1, 1),
            ["Position"] = UDim2.fromScale(0.99, 0.99),
            ["Size"] = UDim2.fromScale(0.065, 0.05),
            ["Text"] = "<b>REGION: " .. p20 .. "</b>",
            ["TextColor3"] = u2.WHITE
        }, { u5.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 16
            }) })
    }
    v23.ServerRegionDisplay = v24("ScreenGui", {
        ["ResetOnSpawn"] = false
    }, v25)
    v21(v22(v23), u6.LocalPlayer:WaitForChild("PlayerGui"))
end
function u12.mountQueueRegionDisplay(_, p26) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u11
        [3] = u6
    --]]
    u5.mount(u5.createElement(u11, {
        ["Region"] = p26.region
    }), u6.LocalPlayer:WaitForChild("PlayerGui"))
end
v3.CreateController(u12.new())
return nil