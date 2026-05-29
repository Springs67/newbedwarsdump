local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u2 = v1.HttpService
local u3 = v1.Workspace
local v4 = {}
local u5 = nil
local u6 = nil
local u7 = nil
local u8 = nil
function v4.getClanUpdateAuditLogs(p9, u10) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u6
        [4] = u7
        [5] = u8
    --]]
    local u11 = DateTime.fromUnixTimestamp(u3:GetServerTimeNow()):ToIsoDate()
    local v12 = 0
    local v13 = {}
    local u14 = {}
    for v15, v16 in { u5(p9, u10), u6(p9, u10), u7(p9) } do
        local _ = v15 - 1
        if v16[1] ~= "None" == true then
            v12 = v12 + 1
            v13[v12] = v16
        end
    end
    local function v21(p17) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u11
            [3] = u10
            [4] = u14
        --]]
        for v18, v19 in u8(u11, u10, p17) do
            local _ = v18 - 1
            local v20 = u14
            table.insert(v20, v19)
            local _ = #u14
        end
    end
    for v22, v23 in v13 do
        v21(v23, v22 - 1, v13)
    end
    return u14
end
u8 = function(p24, p25, p26) --[[ Name: toLogs, Line 46 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v27 = p26[1]
    local v28 = p26[2]
    local v29 = table.create(#v28)
    for v30, v31 in v28 do
        local _ = v30 - 1
        v29[v30] = {
            ["timestamp"] = p24,
            ["actionId"] = v27,
            ["performedByUserId"] = p25,
            ["uuid"] = u2:GenerateGUID(false),
            ["data"] = v31
        }
    end
    return v29
end
u5 = function(p32, p33) --[[ Name: auditJoinClan, Line 66 ]]
    local v34 = p32.members
    if v34 ~= nil then
        local v35 = 0
        v34 = {}
        for v36, v37 in v34 do
            local _ = v36 - 1
            if v37.action == "ADD" == true then
                v35 = v35 + 1
                v34[v35] = v37
            end
        end
    end
    if not v34 or #v34 == 0 then
        return {
            "None",
            {}
        }
    end
    local v38 = table.create(#v34)
    for v39, _ in v34 do
        local _ = v39 - 1
        v38[v39] = {
            ["joinClan"] = {
                ["acceptedByUserId"] = p33
            }
        }
    end
    return { "JoinClan", v38 }
end
u6 = function(p40, p41) --[[ Name: auditLeaveClan, Line 107 ]]
    local v42 = p40.members
    if v42 ~= nil then
        local v43 = 0
        v42 = {}
        for v44, v45 in v42 do
            local _ = v44 - 1
            if v45.action == "REMOVE" == true then
                v43 = v43 + 1
                v42[v43] = v45
            end
        end
    end
    if not v42 or #v42 == 0 then
        return {
            "None",
            {}
        }
    end
    local v46 = table.create(#v42)
    for v47, v48 in v42 do
        local _ = v47 - 1
        v46[v47] = {
            ["leaveClan"] = {
                ["userIdLeft"] = v48.memberId,
                ["kickedByUserId"] = p41
            }
        }
    end
    return { "LeaveClan", v46 }
end
u7 = function(p49) --[[ Name: auditInfoUpdate, Line 146 ]]
    if p49.name == nil and (p49.tag == nil and p49.desc == nil) then
        return {
            "None",
            {}
        }
    end
    local v50 = {}
    local v51 = {}
    local v52 = {
        ["infoChange"] = {
            ["name"] = p49.name,
            ["tag"] = p49.tag,
            ["description"] = p49.desc
        }
    }
    __set_list(v51, 1, {v52})
    __set_list(v50, 1, {"InfoChange", v51})
    return v50
end
return {
    ["ClanAuditLog"] = v4
}