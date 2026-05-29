local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.Signal
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "PermissionController"
    end,
    ["__index"] = u5
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
        [1] = u5
        [2] = u4
    --]]
    u5.constructor(p11)
    p11.Name = "PermissionController"
    p11.permissions = {}
    p11.isReady = false
    p11.onPlayerReady = u4.new()
end
function u8.KnitStart(u12) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
    --]]
    u5.KnitStart(u12)
    u6.Client:Get("PlayerPermsUpdate"):Connect(function(p13) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12.permissions = p13
        u12.isReady = true
        u12.onPlayerReady:Fire(p13)
    end)
end
function u8.waitForLocalPermissions(p14) --[[ Line: 38 ]]
    if p14.isReady then
        return p14.permissions
    else
        return p14.onPlayerReady:Wait()
    end
end
function u8.getLocalPermissions(p15) --[[ Line: 45 ]]
    return p15.permissions
end
function u8.hasPermission(p16, p17) --[[ Line: 48 ]]
    local v18 = p16:getLocalPermissions()
    if v18 then
        return table.find(v18, p17) ~= nil
    else
        return false
    end
end
function u8.hasPermissions(p19, p20) --[[ Line: 56 ]]
    local v21 = p19:getLocalPermissions()
    if not v21 then
        return false
    end
    local v22 = true
    for v23, v24 in p20 do
        local _ = v23 - 1
        if table.find(v21, v24) == nil then
            v22 = false
            break
        end
    end
    return v22
end
function u8.hasAnyPermissions(p25, p26) --[[ Line: 78 ]]
    local v27 = p25:getLocalPermissions()
    if not v27 then
        return false
    end
    local v28 = false
    for v29, v30 in p26 do
        local _ = v29 - 1
        if table.find(v27, v30) ~= nil then
            v28 = true
            break
        end
    end
    return v28
end
function u8.isStaffMember(p31) --[[ Line: 100 ]]
    return p31:hasAnyPermissions({
        "admin",
        "anticheat_mod",
        "artist",
        "director",
        "filmer",
        "mod"
    })
end
function u8.hasAllKitsUnlocked(p32) --[[ Line: 103 ]]
    local v33 = p32:getLocalPermissions()
    if v33 ~= nil then
        v33 = table.find(v33, "all_kits") ~= nil
    end
    return v33 and true or false
end
function u8.hasAllKitSkinsUnlocked(p34) --[[ Line: 114 ]]
    local v35 = p34:getLocalPermissions()
    if v35 ~= nil then
        v35 = table.find(v35, "all_kit_skins") ~= nil
    end
    return v35 and true or false
end
function u8.canTesterAccessRankedSkins(p36) --[[ Line: 125 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v37 = p36:waitForLocalPermissions()
    local v38 = u7.isStaging()
    if v38 then
        v38 = table.find(v37, "tester") ~= nil
        if v38 == nil then
            v38 = false
        end
    end
    return v38
end
v3.CreateController(u8.new())
return nil