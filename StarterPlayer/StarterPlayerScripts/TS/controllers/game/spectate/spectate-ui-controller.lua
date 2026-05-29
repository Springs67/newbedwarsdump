local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.Signal
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u9 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u10 = u1.import(script, script.Parent, "ui", "spectate-selector").SpectateSelectorWrapper
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "SpectateUIController"
    end,
    ["__index"] = u7
})
u11.__index = u11
function u11.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u4
    --]]
    u7.constructor(p14)
    p14.Name = "SpectateUIController"
    p14.maid = u5.new()
    p14.lobbyButtonVisible = true
    p14.buttonVisibilityUpdate = u4.new()
end
function u11.KnitStart(u15) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u1
        [3] = u8
        [4] = u10
        [5] = u6
    --]]
    u9.changed:connect(function(p16, p17) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u8
            [3] = u10
            [4] = u15
            [5] = u6
        --]]
        if p16.Game.spectating ~= p17.Game.spectating then
            if p16.Game.spectating then
                u1.Promise.defer(function() --[[ Line: 38 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u10
                        [3] = u15
                        [4] = u6
                    --]]
                    local u18 = u8("spectate-selector", u10)
                    u15.maid:GiveTask(function() --[[ Line: 40 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u18
                        --]]
                        u6.unmount(u18)
                    end)
                end)
                return
            end
            u1.Promise.defer(function() --[[ Line: 45 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15.maid:DoCleaning()
            end)
        end
    end)
end
function u11.setLobbyButtonsVisiblity(p19, p20) --[[ Line: 52 ]]
    p19.lobbyButtonVisible = p20
    p19.buttonVisibilityUpdate:Fire(p20)
end
function u11.getButtonsVisibility(p21) --[[ Line: 56 ]]
    return p21.lobbyButtonVisible
end
v3.CreateController(u11.new())
return nil