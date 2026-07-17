-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local assertDeepEqual = require(script.Parent.Parent.assertDeepEqual);
    local createElement = require(script.Parent.Parent.createElement);
    local createReconciler = require(script.Parent.Parent.createReconciler);
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer);
    local oneChild = require(script.Parent.Parent.oneChild);
    local Component = require(script.Parent.Parent.Component);
    local u1 = createReconciler(NoopRenderer);
    it("should be provided as an internal api on Component", function() -- Line: 12
        -- upvalues: Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy)
        local v2 = Component:extend("Provider");

        function v2.init(p3) -- Line: 15
            p3:__addContext("foo", "bar");
        end;

        function v2.render(p4) -- Line: 19
        end;

        local v5 = createElement(v2);
        assertDeepEqual(u1.mountVirtualNode(v5, nil, "Provider").context, {
            foo = "bar"
        });
    end);
    it("should be inherited from parent stateful nodes", function() -- Line: 33
        -- upvalues: Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy)
        local u6 = Component:extend("Consumer");
        local u7 = nil;

        function u6.init(p8) -- Line: 37
            -- upvalues: u7 (ref)
            u7 = {
                hello = p8:__getContext("hello"),
                value = p8:__getContext("value")
            };
        end;

        function u6.render(p9) -- Line: 44
        end;

        local v10 = Component:extend("Parent");

        function v10.render(p11) -- Line: 48
            -- upvalues: createElement (ref), u6 (copy)
            return createElement(u6);
        end;

        local v12 = createElement(v10);
        local v13 = {
            hello = "world",
            value = 6
        };
        local v14 = u1.mountVirtualNode(v12, nil, "Parent", v13);
        expect(u7).never.to.equal(v13);
        expect(u7).never.to.equal(v14.context);
        assertDeepEqual(v14.context, v13);
        assertDeepEqual(u7, v13);
    end);
    it("should be inherited from parent function nodes", function() -- Line: 67
        -- upvalues: Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy)
        local u15 = Component:extend("Consumer");
        local u16 = nil;

        function u15.init(p17) -- Line: 71
            -- upvalues: u16 (ref)
            u16 = {
                hello = p17:__getContext("hello"),
                value = p17:__getContext("value")
            };
        end;

        function u15.render(p18) -- Line: 78
        end;

        local v19 = createElement(function() -- Line: 80, Name: Parent
            -- upvalues: createElement (ref), u15 (copy)
            return createElement(u15);
        end);
        local v20 = {
            hello = "world",
            value = 6
        };
        local v21 = u1.mountVirtualNode(v19, nil, "Parent", v20);
        expect(u16).never.to.equal(v20);
        expect(u16).never.to.equal(v21.context);
        assertDeepEqual(v21.context, v20);
        assertDeepEqual(u16, v20);
    end);
    it("should not copy the context table if it doesn\'t need to", function() -- Line: 99
        -- upvalues: Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy), oneChild (copy)
        local v22 = Component:extend("Parent");

        function v22.init(p23) -- Line: 102
            p23:__addContext("parent", "I\'m here!");
        end;

        function v22.render(p24) -- Line: 106
            -- upvalues: createElement (ref)
            return createElement(function() -- Line: 108
            end);
        end;

        local v25 = createElement(v22);
        local v26 = u1.mountVirtualNode(v25, nil, "Parent");
        assertDeepEqual(v26.context, {
            parent = "I\'m here!"
        });
        local v27 = oneChild(v26.children);
        expect(v26.context).to.equal(v27.context);
    end);
    it("should not allow context to move up the tree", function() -- Line: 128
        -- upvalues: Component (copy), createElement (copy), u1 (copy), oneChild (copy), assertDeepEqual (copy)
        local u28 = Component:extend("ChildProvider");

        function u28.init(p29) -- Line: 131
            p29:__addContext("child", "I\'m here too!");
        end;

        function u28.render(p30) -- Line: 135
        end;

        local v31 = Component:extend("ParentProvider");

        function v31.init(p32) -- Line: 139
            p32:__addContext("parent", "I\'m here!");
        end;

        function v31.render(p33) -- Line: 143
            -- upvalues: createElement (ref), u28 (copy)
            return createElement(u28);
        end;

        local v34 = createElement(v31);
        local v35 = u1.mountVirtualNode(v34, nil, "Parent");
        local v36 = oneChild(v35.children);
        assertDeepEqual(v35.context, {
            parent = "I\'m here!"
        });
        assertDeepEqual(v36.context, {
            parent = "I\'m here!",
            child = "I\'m here too!"
        });
    end);
    it("should contain values put into the tree by parent nodes", function() -- Line: 168
        -- upvalues: Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy)
        local u37 = Component:extend("Consumer");
        local u38 = nil;

        function u37.init(p39) -- Line: 172
            -- upvalues: u38 (ref)
            u38 = {
                dont = p39:__getContext("dont"),
                frob = p39:__getContext("frob")
            };
        end;

        function u37.render(p40) -- Line: 179
        end;

        local v41 = Component:extend("Provider");

        function v41.init(p42) -- Line: 183
            p42:__addContext("frob", "ulator");
        end;

        function v41.render(p43) -- Line: 187
            -- upvalues: createElement (ref), u37 (copy)
            return createElement(u37);
        end;

        local v44 = createElement(v41);
        local v45 = {
            dont = "try it"
        };
        local v46 = u1.mountVirtualNode(v44, nil, "Consumer", v45);
        local v47 = {
            dont = "try it",
            frob = "ulator"
        };
        expect(v46.context).never.to.equal(v45);
        expect(u38).never.to.equal(v45);
        expect(u38).never.to.equal(v46.context);
        assertDeepEqual(v45, {
            dont = "try it"
        });
        assertDeepEqual(v46.context, v47);
        assertDeepEqual(u38, v47);
    end);
    it("should transfer context to children that are replaced", function() -- Line: 218
        -- upvalues: Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy)
        local u48 = Component:extend("ConsumerA");

        local function captureAllContext(p49) -- Line: 221
            return {
                A = p49:__getContext("A"),
                B = p49:__getContext("B"),
                frob = p49:__getContext("frob")
            };
        end;

        local u50 = nil;

        function u48.init(p51) -- Line: 230
            -- upvalues: u50 (ref), captureAllContext (copy)
            p51:__addContext("A", "hello");
            u50 = captureAllContext(p51);
        end;

        function u48.render(p52) -- Line: 236
        end;

        local u53 = Component:extend("ConsumerB");
        local u54 = nil;

        function u53.init(p55) -- Line: 241
            -- upvalues: u54 (ref), captureAllContext (copy)
            p55:__addContext("B", "hello");
            u54 = captureAllContext(p55);
        end;

        function u53.render(p56) -- Line: 247
        end;

        local v57 = Component:extend("Provider");

        function v57.init(p58) -- Line: 251
            p58:__addContext("frob", "ulator");
        end;

        function v57.render(p59) -- Line: 255
            -- upvalues: createElement (ref), u53 (copy), u48 (copy)
            if p59.props.useConsumerB then
                return createElement(u53);
            end;

            return createElement(u48);
        end;

        local v60 = createElement(v57);
        local v61 = u1.mountVirtualNode(v60, nil, "Consumer");
        assertDeepEqual(u50, {
            frob = "ulator",
            A = "hello"
        });
        local v62 = createElement(v57, {
            useConsumerB = true
        });
        u1.updateVirtualNode(v61, v62);
        assertDeepEqual(u54, {
            frob = "ulator",
            B = "hello"
        });
    end);
end;