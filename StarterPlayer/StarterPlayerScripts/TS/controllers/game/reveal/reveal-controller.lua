local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "RevealController"
    end,
    ["__index"] = u6
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p11)
    p11.Name = "RevealController"
    p11.revealedPlayers = {}
end
function u8.KnitStart(u12) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u2
    --]]
    u6.KnitStart(u12)
    u7.Client:Get("RevealPlayers"):Connect(function(p13) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12:revealForViewer(p13)
    end)
    u7.Client:Get("UnrevealPlayers"):Connect(function(p14) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12:unrevealForViewer(p14)
    end)
    u2(function(u15, _) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        local v16 = u12.revealedPlayers[u15]
        if not v16 then
            return nil
        end
        v16:Destroy()
        task.spawn(function() --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u15
            --]]
            local v17 = u12:createHighlight(u15)
            if v17 then
                u12.revealedPlayers[u15] = v17
            end
        end)
    end)
end
function u8.revealForViewer(u18, p19) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    for v20, u21 in p19 do
        local _ = v20 - 1
        if u21 ~= u5.LocalPlayer then
            task.spawn(function() --[[ Line: 61 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u21
                --]]
                local v22 = u18:createHighlight(u21)
                if v22 then
                    u18.revealedPlayers[u21] = v22
                end
            end)
        end
    end
end
function u8.unrevealForViewer(p23, p24) --[[ Line: 74 ]]
    for v25, v26 in p24 do
        local _ = v25 - 1
        local v27 = p23.revealedPlayers[v26]
        if v27 ~= nil then
            v27:Destroy()
        end
        p23.revealedPlayers[v26] = nil
    end
end
function u8.createHighlight(_, p28) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v29 = p28.Character
    if v29 then
        return u4("Highlight", {
            ["FillTransparency"] = 1,
            ["OutlineTransparency"] = 0,
            ["Parent"] = v29,
            ["OutlineColor"] = Color3.fromRGB(255, 120, 120),
            ["DepthMode"] = Enum.HighlightDepthMode.AlwaysOnTop
        })
    else
        return nil
    end
end
v3.CreateController(u8.new())
return nil