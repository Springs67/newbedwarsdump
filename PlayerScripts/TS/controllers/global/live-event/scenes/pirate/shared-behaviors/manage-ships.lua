-- Decompiled with Potassium's decompiler.

local Workspace = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;

return {
    ManageShipsBehavior = {
        name = "Manage ships",
        priority = 100,
        event = "Heartbeat",

        func = function(p1, p2, p3) -- Line: 8, Name: func
            -- upvalues: Workspace (copy)
            if p3 ~= nil then
                p3 = p3:get("ships");
            end;

            local v4 = p2:get("ships");

            if v4 == nil then
                v4 = {};
                p2:set("ships", v4);
            end;

            for i, v in v4 do
                v.instance:PivotTo(v.cframe);

                if not v.instance:IsDescendantOf(Workspace) then
                    v4[i] = nil;
                end;
            end;

            if p3 then
                for i, v in p3 do
                    if not v4[i] then
                        v.instance:Destroy();
                    end;
                end;
            end;

            p2:set("ships", v4);
        end
    }
};