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
    it("should be invoked when props update", function() -- Line: 13
        -- upvalues: Component (copy), createSpy (copy), createElement (copy), u1 (copy), Type (copy), assertDeepEqual (copy)
        local v2 = Component:extend("MyComponent");
        local u3 = nil;
        local u4 = nil;
        local v6 = createSpy(function(p5) -- Line: 18
            -- upvalues: u3 (ref), u4 (ref)
            u3 = p5.props;
            u4 = p5.state;

            return true;
        end);
        v2.shouldUpdate = v6.value;

        function v2.render(p7) -- Line: 27
            return nil;
        end;

        local v8 = {
            a = 5
        };
        local v9 = createElement(v2, v8);
        local v10 = u1.mountVirtualNode(v9, nil, "Test");
        expect(v6.callCount).to.equal(0);
        local v11 = {
            a = 6,
            b = 2
        };
        local v12 = createElement(v2, v11);
        u1.updateVirtualNode(v10, v12);
        expect(v6.callCount).to.equal(1);
        local v13 = v6:captureValues("self", "newProps", "newState");
        expect(Type.of(v13.self)).to.equal(Type.StatefulComponentInstance);
        assertDeepEqual(v13.newProps, v11);
        assertDeepEqual(u3, v8);
        expect(v13.newState).to.equal(u4);
        assertDeepEqual(u4, {});
    end);
    it("should be invoked when state is updated", function() -- Line: 63
        -- upvalues: Component (copy), createSpy (copy), createElement (copy), u1 (copy), Type (copy), assertDeepEqual (copy)
        local v14 = Component:extend("MyComponent");
        local u15 = {
            a = 1
        };
        local u16 = nil;
        local u17 = nil;

        function v14.init(u18) -- Line: 72
            -- upvalues: u16 (ref), u15 (copy), u17 (ref)
            u16 = function(...) -- Line: 73
                -- upvalues: u18 (copy)
                return u18:setState(...);
            end;

            u18:setState(u15);
            u17 = u18.state;
        end;

        local u19 = nil;
        local u20 = nil;
        local v22 = createSpy(function(p21) -- Line: 84
            -- upvalues: u19 (ref), u20 (ref)
            u19 = p21.props;
            u20 = p21.state;

            return true;
        end);
        v14.shouldUpdate = v22.value;

        function v14.render(p23) -- Line: 93
            return nil;
        end;

        local v24 = createElement(v14);
        u1.mountVirtualNode(v24, nil, "Test");
        expect(v22.callCount).to.equal(0);
        local v25 = {
            a = 2,
            b = 3
        };
        u16(v25);
        expect(v22.callCount).to.equal(1);
        local v26 = v22:captureValues("self", "newProps", "newState");
        expect(Type.of(v26.self)).to.equal(Type.StatefulComponentInstance);
        expect(v26.newProps).to.equal(u19);
        assertDeepEqual(u19, {});
        assertDeepEqual(u20, u15);
        expect(u20).to.equal(u17);
        assertDeepEqual(v26.newState, v25);
    end);
    it("should not abort an update when returning true", function() -- Line: 126
        -- upvalues: Component (copy), createSpy (copy), createElement (copy), u1 (copy)
        local v27 = Component:extend("MyComponent");

        function v27.shouldUpdate(p28) -- Line: 129
            return true;
        end;

        local v29 = createSpy();
        v27.render = v29.value;
        local v30 = createElement(v27);
        local v31 = u1.mountVirtualNode(v30, nil, "Test");
        expect(v29.callCount).to.equal(1);
        local v32 = createElement(v27);
        u1.updateVirtualNode(v31, v32);
        expect(v29.callCount).to.equal(2);
    end);
    it("should abort an update when retuning false", function() -- Line: 151
        -- upvalues: Component (copy), createSpy (copy), createElement (copy), u1 (copy)
        local v33 = Component:extend("MyComponent");

        function v33.shouldUpdate(p34) -- Line: 154
            return false;
        end;

        local v35 = createSpy();
        v33.render = v35.value;
        local v36 = createElement(v33);
        local v37 = u1.mountVirtualNode(v36, nil, "Test");
        expect(v35.callCount).to.equal(1);
        local v38 = createElement(v33);
        u1.updateVirtualNode(v37, v38);
        expect(v35.callCount).to.equal(1);
    end);
end;