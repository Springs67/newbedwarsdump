local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
return {
    ["ManageShipsBehavior"] = {
        ["name"] = "Manage ships",
        ["priority"] = 100,
        ["event"] = "Heartbeat",
        ["func"] = function(_, p2, p3) --[[ Name: func, Line 8 ]]
            --[[
            Upvalues:
                [1] = u1
            --]]
            if p3 ~= nil then
                p3 = p3:get("ships")
            end
            local v4 = p2:get("ships")
            if v4 == nil then
                v4 = {}
                p2:set("ships", v4)
            end
            for v5, v6 in v4 do
                v6.instance:PivotTo(v6.cframe)
                if not v6.instance:IsDescendantOf(u1) then
                    v4[v5] = nil
                end
            end
            if p3 then
                for v7, v8 in p3 do
                    if not v4[v7] then
                        v8.instance:Destroy()
                    end
                end
            end
            p2:set("ships", v4)
        end
    }
}