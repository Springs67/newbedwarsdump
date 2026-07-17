-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local assertDeepEqual = require(script.Parent.Parent.assertDeepEqual);
    local createElement = require(script.Parent.Parent.createElement);
    local createReconciler = require(script.Parent.Parent.createReconciler);
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer);
    local Component = require(script.Parent.Parent.Component);
    local u1 = createReconciler(NoopRenderer);
    it("should be provided as a mutable self._context in Component:init", function() -- Line: 11
        -- upvalues: Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy)
        local v2 = Component:extend("Provider");

        function v2.init(p3) -- Line: 14
            p3._context.foo = "bar";
        end;

        function v2.render(p4) -- Line: 18
        end;

        local v5 = createElement(v2);
        assertDeepEqual(u1.mountVirtualNode(v5, nil, "Provider").legacyContext, {
            foo = "bar"
        });
    end);
    it("should be inherited from parent stateful nodes", function() -- Line: 32
        -- upvalues: Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy)
        local u6 = Component:extend("Consumer");
        local u7 = nil;

        function u6.init(p8) -- Line: 36
            -- upvalues: u7 (ref)
            u7 = p8._context;
        end;

        function u6.render(p9) -- Line: 40
        end;

        local v10 = Component:extend("Parent");

        function v10.render(p11) -- Line: 44
            -- upvalues: createElement (ref), u6 (copy)
            return createElement(u6);
        end;

        local v12 = createElement(v10);
        local v13 = {
            hello = "world",
            value = 6
        };
        local v14 = u1.mountVirtualNode(v12, nil, "Parent", nil, v13);
        expect(u7).never.to.equal(v13);
        expect(u7).never.to.equal(v14.legacyContext);
        assertDeepEqual(v14.legacyContext, v13);
        assertDeepEqual(u7, v13);
    end);
    it("should be inherited from parent function nodes", function() -- Line: 63
        -- upvalues: Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy)
        local u15 = Component:extend("Consumer");
        local u16 = nil;

        function u15.init(p17) -- Line: 67
            -- upvalues: u16 (ref)
            u16 = p17._context;
        end;

        function u15.render(p18) -- Line: 71
        end;

        local v19 = createElement(function() -- Line: 73, Name: Parent
            -- upvalues: createElement (ref), u15 (copy)
            return createElement(u15);
        end);
        local v20 = {
            hello = "world",
            value = 6
        };
        local v21 = u1.mountVirtualNode(v19, nil, "Parent", nil, v20);
        expect(u16).never.to.equal(v20);
        expect(u16).never.to.equal(v21.legacyContext);
        assertDeepEqual(v21.legacyContext, v20);
        assertDeepEqual(u16, v20);
    end);
    it("should contain values put into the tree by parent nodes", function() -- Line: 92
        -- upvalues: Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy)
        local u22 = Component:extend("Consumer");
        local u23 = nil;

        function u22.init(p24) -- Line: 96
            -- upvalues: u23 (ref)
            u23 = p24._context;
        end;

        function u22.render(p25) -- Line: 100
        end;

        local v26 = Component:extend("Provider");

        function v26.init(p27) -- Line: 104
            p27._context.frob = "ulator";
        end;

        function v26.render(p28) -- Line: 108
            -- upvalues: createElement (ref), u22 (copy)
            return createElement(u22);
        end;

        local v29 = createElement(v26);
        local v30 = {
            dont = "try it"
        };
        local v31 = u1.mountVirtualNode(v29, nil, "Consumer", nil, v30);
        local v32 = {
            dont = "try it",
            frob = "ulator"
        };
        expect(v31.legacyContext).never.to.equal(v30);
        expect(u23).never.to.equal(v30);
        expect(u23).never.to.equal(v31.legacyContext);
        assertDeepEqual(v30, {
            dont = "try it"
        });
        assertDeepEqual(v31.legacyContext, v32);
        assertDeepEqual(u23, v32);
    end);
    it("should transfer context to children that are replaced", function() -- Line: 139
        -- upvalues: Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy)
        local u33 = Component:extend("ConsumerA");
        local u34 = nil;

        function u33.init(p35) -- Line: 143
            -- upvalues: u34 (ref)
            p35._context.A = "hello";
            u34 = p35._context;
        end;

        function u33.render(p36) -- Line: 149
        end;

        local u37 = Component:extend("ConsumerB");
        local u38 = nil;

        function u37.init(p39) -- Line: 154
            -- upvalues: u38 (ref)
            p39._context.B = "hello";
            u38 = p39._context;
        end;

        function u37.render(p40) -- Line: 160
        end;

        local v41 = Component:extend("Provider");

        function v41.init(p42) -- Line: 164
            p42._context.frob = "ulator";
        end;

        function v41.render(p43) -- Line: 168
            -- upvalues: createElement (ref), u37 (copy), u33 (copy)
            if p43.props.useConsumerB then
                return createElement(u37);
            end;

            return createElement(u33);
        end;

        local v44 = createElement(v41);
        local v45 = u1.mountVirtualNode(v44, nil, "Consumer");
        assertDeepEqual(u34, {
            frob = "ulator",
            A = "hello"
        });
        local v46 = createElement(v41, {
            useConsumerB = true
        });
        u1.updateVirtualNode(v45, v46);
        assertDeepEqual(u38, {
            frob = "ulator",
            B = "hello"
        });
    end);
end;