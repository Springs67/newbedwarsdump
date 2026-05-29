local u1 = {
    ["newestKit"] = nil,
    ["updates"] = {}
}
return {
    ["GameUpdatesReducer"] = function(p2, p3) --[[ Name: GameUpdatesReducer, Line 6 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        if p2 == nil then
            p2 = u1
        end
        local v4 = {}
        for v5, v6 in p2 do
            v4[v5] = v6
        end
        local v7 = p3.type
        if v7 == "GameUpdatesSetAll" then
            v4.updates = p3.updates
            v4.newestKit = p3.newestKit
            v4.newestKitBG = p3.newestKitBG
            return v4
        end
        if v7 ~= "AddUIAlerts" then
            if v7 == "ConfirmUIAlert" then
                local v8 = v4.uiAlerts
                if v8 ~= nil then
                    v8 = v8[p3.uiAlert]
                end
                if v8 then
                    local v9 = p3.amount
                    if v9 == 0 or (v9 ~= v9 or not v9) then
                        v8.alerts = 0
                        return v4
                    end
                    local v10 = v8.alerts - p3.amount
                    v8.alerts = math.max(v10, 0)
                    return v4
                end
            end
            return v4
        end
        local v11 = {}
        local v12 = p2.uiAlerts
        if type(v12) == "table" then
            for v13, v14 in v12 do
                v11[v13] = v14
            end
        end
        local v15 = p3.uiAlerts
        if type(v15) == "table" then
            for v16, v17 in v15 do
                v11[v16] = v17
            end
        end
        v4.uiAlerts = v11
        return v4
    end
}