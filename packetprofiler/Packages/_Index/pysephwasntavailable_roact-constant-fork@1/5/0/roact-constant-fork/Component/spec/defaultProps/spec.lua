-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local assertDeepEqual = require(script.Parent.Parent.assertDeepEqual);
    local createElement = require(script.Parent.Parent.createElement);
    local createReconciler = require(script.Parent.Parent.createReconciler);
    local None = require(script.Parent.Parent.None);
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer);
    local Component = require(script.Parent.Parent.Component);
    local u1 = createReconciler(NoopRenderer);
    it("should fill in when mounting before init", function() -- Line: 12
        -- upvalues: Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy)
        local v2 = {
            a = 3,
            b = 2
        };
        local v3 = Component:extend("Foo");
        v3.defaultProps = v2;
        local u4 = nil;

        function v3.init(p5) -- Line: 23
            -- upvalues: u4 (ref)
            u4 = p5.props;
        end;

        function v3.render(p6) -- Line: 27
        end;

        local v7 = {
            b = 4,
            c = 6
        };
        local v8 = createElement(v3, v7);
        u1.mountVirtualNode(v8, nil, "Some Foo");
        assertDeepEqual(u4, {
            a = v2.a,
            b = v7.b,
            c = v7.c
        });
    end);
    it("should fill in when updating via props", function() -- Line: 49
        -- upvalues: Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy)
        local v9 = {
            a = 3,
            b = 2
        };
        local v10 = Component:extend("Foo");
        v10.defaultProps = v9;
        local u11 = nil;

        function v10.render(p12) -- Line: 60
            -- upvalues: u11 (ref)
            u11 = p12.props;
        end;

        local v13 = createElement(v10, {
            b = 4,
            c = 6
        });
        local v14 = u1.mountVirtualNode(v13, nil, "Some Foo");
        local v15 = {
            c = 5
        };
        local v16 = createElement(v10, v15);
        u1.updateVirtualNode(v14, v16);
        assertDeepEqual(u11, {
            a = v9.a,
            b = v9.b,
            c = v15.c
        });
    end);
    it("should respect None to override a default prop with nil", function() -- Line: 91
        -- upvalues: Component (copy), None (copy), createElement (copy), u1 (copy), assertDeepEqual (copy)
        local v17 = {
            a = 3,
            b = 2
        };
        local v18 = Component:extend("Foo");
        v18.defaultProps = v17;
        local u19 = nil;

        function v18.render(p20) -- Line: 102
            -- upvalues: u19 (ref)
            u19 = p20.props;
        end;

        local v21 = {
            c = 4,
            b = None
        };
        local v22 = createElement(v18, v21);
        u1.mountVirtualNode(v22, nil, "Some Foo");
        assertDeepEqual(u19, {
            b = nil,
            a = v17.a,
            c = v21.c
        });
    end);
end;