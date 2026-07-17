-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local assertDeepEqual = require(script.Parent.Parent.assertDeepEqual);
    local createElement = require(script.Parent.Parent.createElement);
    local createReconciler = require(script.Parent.Parent.createReconciler);
    local createSpy = require(script.Parent.Parent.createSpy);
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer);
    local Type = require(script.Parent.Parent.Type);
    local Component = require(script.Parent.Parent.Component);
    local u1 = createReconciler(NoopRenderer);
    it("should be invoked when updated via updateVirtualNode", function() -- Line: 13
        -- upvalues: Component (copy), createSpy (copy), createElement (copy), u1 (copy), Type (copy), assertDeepEqual (copy)
        local v2 = Component:extend("MyComponent");
        local v3 = createSpy();
        v2.willUpdate = v3.value;

        function v2.render(p4) -- Line: 20
            return nil;
        end;

        local v5 = createElement(v2, {
            a = 5
        });
        local v6 = u1.mountVirtualNode(v5, nil, "Test");
        local v7 = {
            a = 6,
            b = 2
        };
        local v8 = createElement(v2, v7);
        u1.updateVirtualNode(v6, v8);
        expect(v3.callCount).to.equal(1);
        local v9 = v3:captureValues("self", "newProps", "newState");
        expect(Type.of(v9.self)).to.equal(Type.StatefulComponentInstance);
        assertDeepEqual(v9.newProps, v7);
        assertDeepEqual(v9.newState, {});
    end);
    it("it should be invoked when updated via setState", function() -- Line: 49
        -- upvalues: Component (copy), createSpy (copy), createElement (copy), u1 (copy), Type (copy), assertDeepEqual (copy)
        local v10 = Component:extend("MyComponent");
        local u11 = nil;
        local v12 = createSpy();
        v10.willUpdate = v12.value;

        function v10.init(u13) -- Line: 57
            -- upvalues: u11 (ref)
            u11 = function(p14) -- Line: 58
                -- upvalues: u13 (copy)
                u13:setState(p14);
            end;

            u13:setState({
                foo = 1
            });
        end;

        function v10.render(p15) -- Line: 67
            return nil;
        end;

        local v16 = createElement(v10);
        u1.mountVirtualNode(v16, nil, "Test");
        expect(v12.callCount).to.equal(0);
        u11({
            foo = 2
        });
        expect(v12.callCount).to.equal(1);
        local v17 = v12:captureValues("self", "newProps", "newState");
        expect(Type.of(v17.self)).to.equal(Type.StatefulComponentInstance);
        assertDeepEqual(v17.newProps, {});
        assertDeepEqual(v17.newState, {
            foo = 2
        });
    end);
end;