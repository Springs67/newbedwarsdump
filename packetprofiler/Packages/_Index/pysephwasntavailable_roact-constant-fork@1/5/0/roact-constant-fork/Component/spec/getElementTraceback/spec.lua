-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local createElement = require(script.Parent.Parent.createElement);
    local createReconciler = require(script.Parent.Parent.createReconciler);
    local GlobalConfig = require(script.Parent.Parent.GlobalConfig);
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer);
    local Component = require(script.Parent.Parent.Component);
    local u1 = createReconciler(NoopRenderer);
    it("should return stack traces in initial renders", function() -- Line: 11
        -- upvalues: Component (copy), GlobalConfig (copy), createElement (copy), u1 (copy)
        local u2 = Component:extend("TestComponent");
        local u3 = nil;

        function u2.init(p4) -- Line: 15
            -- upvalues: u3 (ref)
            u3 = p4:getElementTraceback();
        end;

        function u2.render(p5) -- Line: 19
            return nil;
        end;

        GlobalConfig.scoped({
            elementTracing = true
        }, function() -- Line: 27
            -- upvalues: createElement (ref), u2 (copy), u1 (ref)
            local v6 = createElement(u2);
            u1.mountVirtualNode(v6, nil, "Some key");
        end);
        expect(u3).to.be.a("string");
    end);
    itSKIP("it should return an updated stack trace after an update", function() -- Line: 38
    end);
    it("should return nil when elementTracing is off", function() -- Line: 40
        -- upvalues: Component (copy), GlobalConfig (copy), createElement (copy), u1 (copy)
        local u7 = nil;
        local u8 = Component:extend("TestComponent");

        function u8.init(p9) -- Line: 49
            -- upvalues: u7 (ref)
            u7 = p9:getElementTraceback();
        end;

        function u8.render(p10) -- Line: 53
            return nil;
        end;

        GlobalConfig.scoped({
            elementTracing = false
        }, function() -- Line: 57
            -- upvalues: createElement (ref), u8 (copy), u1 (ref)
            local v11 = createElement(u8);
            u1.mountVirtualNode(v11, nil, "Some key");
        end);
        expect(u7).to.equal(nil);
    end);
end;