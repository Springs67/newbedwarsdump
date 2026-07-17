-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local Parent = require(script.Parent);
    it("should load with all public APIs", function() -- Line: 4
        -- upvalues: Parent (copy)
        local v1 = {
            createElement = "function",
            createFragment = "function",
            createRef = "function",
            forwardRef = "function",
            createBinding = "function",
            joinBindings = "function",
            mount = "function",
            unmount = "function",
            update = "function",
            oneChild = "function",
            setGlobalConfig = "function",
            createContext = "function",
            reify = "function",
            teardown = "function",
            reconcile = "function",
            Component = true,
            PureComponent = true,
            Portal = true,
            Children = true,
            Event = true,
            Change = true,
            Ref = true,
            None = true,
            UNSTABLE = true
        };
        expect(Parent).to.be.ok();

        for i, v in pairs(v1) do
            local v2;

            if typeof(v) == "string" then
                v2 = typeof(Parent[i]) == v;
            else
                v2 = Parent[i] ~= nil;
            end;

            if not v2 then
                local v3 = typeof(v) == "boolean" and "present" or "of type " .. tostring(v);
                local v4 = ("Expected public API member %q to be %s, but instead it was of type %s"):format(tostring(i), v3, (typeof(Parent[i])));
                error(v4);
            end;
        end;

        for i in pairs(Parent) do
            if v1[i] == nil then
                local v5 = ("Found unknown public API key %q!"):format((tostring(i)));
                error(v5);
            end;
        end;
    end);
end;