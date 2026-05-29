local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "GameUpdatesController"
    end,
    ["__index"] = u4
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
    --]]
    u4.constructor(p12)
    p12.Name = "GameUpdatesController"
    p12.remotes = u7.Client:GetNamespace("Update")
end
function u9.KnitStart(u13) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u5
        [4] = u3
    --]]
    u4.KnitStart(u13)
    if u8.isGameServer() then
        return nil
    end
    u13.remotes:WaitFor("FetchGameUpdates"):andThen(function(p14) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u13
        --]]
        local v15 = p14:CallServer()
        if not v15.success then
            return nil
        end
        if v15.updates then
            u5:dispatch({
                ["type"] = "GameUpdatesSetAll",
                ["updates"] = v15.updates,
                ["newestKit"] = v15.newestKit,
                ["newestKitBG"] = v15.newestKitBG
            })
        end
        if v15.newUpdate then
            if u3.LocalPlayer:GetAttribute("FirstTimePlayer") == nil then
                u3.LocalPlayer:GetAttributeChangedSignal("FirstTimePlayer"):Wait()
            end
            if u3.LocalPlayer:GetAttribute("HideOtherPopupsForRental") == nil then
                u3.LocalPlayer:GetAttributeChangedSignal("HideOtherPopupsForRental"):Wait()
            end
            if u3.LocalPlayer:GetAttribute("FirstTimePlayer") ~= true and u3.LocalPlayer:GetAttribute("HideOtherPopupsForRental") ~= true then
                u13:openGameUpdateApp()
            end
        end
    end)
end
function u9.openGameUpdateApp(_) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
    --]]
    u2.Controllers.UiQueueManagerController:queueApp({
        ["priority"] = 10000,
        ["app"] = u6.GAME_UPDATES,
        ["props"] = {}
    })
end
u2.CreateController(u9.new())
return nil