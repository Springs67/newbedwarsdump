local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitServer
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.Players
local u5 = v3.RunService
local u6 = v3.Workspace
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-save-util").MapSaveUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "ScriptEditorUtil"
    end
})
u9.__index = u9
function u9.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(_) --[[ Line: 22 ]] end
function u9.hasScriptEditorPermission(_, p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u8
        [4] = u7
        [5] = u6
    --]]
    if u5:IsClient() then
        return true
    end
    if u2.Services.BedwarsPermissionService:playerHasPermission(p12, "admin") then
        return true
    end
    if u8.isGameServer() then
        local v13 = u2.Services.MapService:getMapDocument()
        if v13 ~= nil then
            v13 = v13:getLoadedCustomMapSave()
        end
        local v14
        if v13 == nil then
            v14 = v13
        else
            v14 = v13.copylock
        end
        if v14 then
            local v15 = u7
            if v13 ~= nil then
                v13 = v13.creator
            end
            v14 = not v15:canBypassCopylock(p12, v13)
        end
        if v14 then
            return false
        end
    elseif u8.isLobbyServer() then
        local v16 = u6:WaitForChild("Map"):GetAttribute("MapSave_CopyLocked")
        local v17 = u6:WaitForChild("Map"):GetAttribute("MapSave_MapCreatorUserId")
        if v16 then
            if v17 ~= 0 and (v17 == v17 and v17) then
                v17 = v17 ~= p12.UserId
            end
        else
            v17 = v16
        end
        if v17 ~= 0 and (v17 == v17 and v17) then
            return false
        end
    end
    return u2.Services.CustomMatchService:isCustomMatchAdmin(p12)
end
function u9.getAllPlayersWithScriptEditPerms(_) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
    --]]
    local v18 = 0
    local v19 = {}
    for v20, v21 in u4:GetPlayers() do
        local _ = v20 - 1
        if u9:hasScriptEditorPermission(v21) == true then
            v18 = v18 + 1
            v19[v18] = v21
        end
    end
    return v19
end
function u9.cleanScriptName(p22, p23) --[[ Line: 90 ]]
    local v24 = p22:liveCleanScriptName(p23)
    local v25 = string.gsub(v24, "-*$", "")
    return string.gsub(v25, "_*$", "")
end
function u9.liveCleanScriptName(p26, p27) --[[ Line: 97 ]]
    local v28 = string.gsub(p27, " +", "-")
    local v29 = string.gsub(v28, "[^a-zA-Z0-9_-]", "")
    local v30 = string.gsub(v29, "-+", "-")
    local v31 = string.gsub(v30, "_+", "_")
    local v32 = string.gsub(v31, "^-*", "")
    local v33 = string.gsub(v32, "^_*", "")
    if #p27 > 26 then
        v33 = p26:liveCleanScriptName((string.sub(v33, 0, 26)))
    end
    return v33
end
function u9.setModelCollisions(_, p34, p35) --[[ Line: 115 ]]
    for v36, v37 in p34:GetDescendants() do
        local _ = v36 - 1
        if v37:IsA("MeshPart") or v37:IsA("BasePart") then
            v37.CanCollide = p35
        end
    end
end
function u9.setModelAnchored(_, p38, p39) --[[ Line: 126 ]]
    for v40, v41 in p38:GetDescendants() do
        local _ = v40 - 1
        if v41:IsA("MeshPart") or v41:IsA("BasePart") then
            v41.Anchored = p39
            v41.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        end
    end
end
function u9.setModelTransparency(_, p42, p43) --[[ Line: 138 ]]
    for v44, v45 in p42:GetDescendants() do
        local _ = v44 - 1
        if v45:IsA("BasePart") or (v45:IsA("MeshPart") or (v45:IsA("Decal") or v45:IsA("Texture"))) then
            v45.Transparency = p43
        end
    end
end
u9.MAX_SCRIPT_LENGTH = 150000
u9.MAX_SCRIPT_NAME_LENGTH = 32
u9.MAX_VISIBLE_CONSOLE_LINES = 500
return {
    ["ScriptEditorUtil"] = u9
}