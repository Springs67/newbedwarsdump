-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local assertDeepEqual = require(script.Parent.Parent.assertDeepEqual);
    local createSpy = require(script.Parent.Parent.createSpy);
    local createElement = require(script.Parent.Parent.createElement);
    local createFragment = require(script.Parent.Parent.createFragment);
    local createReconciler = require(script.Parent.Parent.createReconciler);
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer);
    local Component = require(script.Parent.Parent.Component);
    local u1 = createReconciler(NoopRenderer);
    it("should be invoked on initial mount", function() -- Line: 13
        -- upvalues: createSpy (copy), Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy)
        local v2 = createSpy();
        local v3 = Component:extend("WithDerivedState");
        v3.getDerivedStateFromProps = v2.value;

        function v3.render(p4) -- Line: 19
            return nil;
        end;

        local v5 = createElement(v3, {
            someProp = 1
        });
        u1.mountVirtualNode(v5, nil, "WithDerivedState");
        expect(v2.callCount).to.equal(1);
        local v6 = v2:captureValues("props", "state");
        assertDeepEqual(v6.props, {
            someProp = 1
        });
        assertDeepEqual(v6.state, {});
    end);
    it("should be invoked when updated via props", function() -- Line: 39
        -- upvalues: createSpy (copy), Component (copy), u1 (copy), createElement (copy), assertDeepEqual (copy)
        local v7 = createSpy();
        local v8 = Component:extend("WithDerivedState");
        v8.getDerivedStateFromProps = v7.value;

        function v8.render(p9) -- Line: 45
            return nil;
        end;

        local v10 = u1.mountVirtualNode(createElement(v8, {
            someProp = 1
        }), nil, "WithDerivedState");
        u1.updateVirtualNode(v10, createElement(v8, {
            someProp = 2
        }));
        expect(v7.callCount).to.equal(2);
        local v11 = v7:captureValues("props", "state");
        assertDeepEqual(v11.props, {
            someProp = 2
        });
        assertDeepEqual(v11.state, {});
    end);
    it("should be invoked when updated via state", function() -- Line: 75
        -- upvalues: createSpy (copy), Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy)
        local v12 = createSpy();
        local v13 = Component:extend("WithDerivedState");
        v13.getDerivedStateFromProps = v12.value;

        function v13.init(p14) -- Line: 81
            p14:setState({
                someState = 1
            });
        end;

        function v13.render(p15) -- Line: 87
            return nil;
        end;

        local v16 = createElement(v13);
        local v17 = u1.mountVirtualNode(v16, nil, "WithDerivedState");
        u1.updateVirtualNode(v17, v16, {
            someState = 2
        });
        expect(v12.callCount).to.equal(4);
        local v18 = v12:captureValues("props", "state");
        assertDeepEqual(v18.props, {});
        assertDeepEqual(v18.state, {
            someState = 2
        });
    end);
    it("should be invoked when updating via state in init (which skips reconciliation)", function() -- Line: 114
        -- upvalues: createSpy (copy), Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy)
        local v19 = createSpy();
        local v20 = Component:extend("WithDerivedState");
        v20.getDerivedStateFromProps = v19.value;

        function v20.init(p21) -- Line: 120
            p21:setState({
                stateFromInit = 1
            });
        end;

        function v20.render(p22) -- Line: 126
            return nil;
        end;

        local v23 = createElement(v20, {
            someProp = 1
        });
        u1.mountVirtualNode(v23, nil, "WithDerivedState");
        expect(v19.callCount).to.equal(3);
        local v24 = v19:captureValues("props", "state");
        assertDeepEqual(v24.props, {
            someProp = 1
        });
        assertDeepEqual(v24.state, {
            stateFromInit = 1
        });
    end);
    it("should receive defaultProps", function() -- Line: 154
        -- upvalues: createSpy (copy), Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy)
        local v25 = createSpy();
        local v26 = Component:extend("WithDerivedState");
        v26.defaultProps = {
            someDefaultProp = "foo"
        };
        v26.getDerivedStateFromProps = v25.value;

        function v26.render(p27) -- Line: 164
            return nil;
        end;

        local v28 = createElement(v26, {
            someProp = 1
        });
        local v29 = u1.mountVirtualNode(v28, nil, "WithDerivedState");
        expect(v25.callCount).to.equal(1);
        assertDeepEqual(v25:captureValues("props", "state").props, {
            someDefaultProp = "foo",
            someProp = 1
        });
        local v30 = createElement(v26, {
            someProp = 2
        });
        u1.updateVirtualNode(v29, v30);
        expect(v25.callCount).to.equal(2);
        assertDeepEqual(v25:captureValues("props", "state").props, {
            someDefaultProp = "foo",
            someProp = 2
        });
    end);
    it("should derive state for all setState updates, even when deferred", function() -- Line: 202
        -- upvalues: Component (copy), createSpy (copy), createFragment (copy), createElement (copy), u1 (copy)
        local u31 = Component:extend("Child");
        local u32 = createSpy(function() -- Line: 204
            return {};
        end);
        local v33 = createSpy();

        function u31.render(p34) -- Line: 209
            return nil;
        end;

        function u31.didMount(p35) -- Line: 213
            p35.props.callback();
        end;

        local v36 = Component:extend("Parent");
        v36.getDerivedStateFromProps = v33.value;

        function v36.render(u37) -- Line: 221
            -- upvalues: u32 (copy), createFragment (ref), createElement (ref), u31 (copy)
            local function v38() -- Line: 222
                -- upvalues: u37 (copy), u32 (ref)
                u37:setState(u32.value);
            end;

            return createFragment({
                ChildA = createElement(u31, {
                    callback = v38
                }),
                ChildB = createElement(u31, {
                    callback = v38
                })
            });
        end;

        local v39 = createElement(v36);
        u1.mountVirtualNode(v39, nil, "Test");
        expect(u32.callCount).to.equal(2);
        expect(v33.callCount).to.equal(3);
    end);
    it("should have derived state after assigning to state in init", function() -- Line: 248
        -- upvalues: createSpy (copy), Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy)
        local u40 = nil;
        local v41 = createSpy(function() -- Line: 250
            return {
                derived = true
            };
        end);
        local v42 = Component:extend("WithDerivedState");
        v42.getDerivedStateFromProps = v41.value;

        function v42.init(u43) -- Line: 259
            -- upvalues: u40 (ref)
            u43.state = {
                init = true
            };

            u40 = function() -- Line: 264
                -- upvalues: u43 (copy)
                return u43.state;
            end;
        end;

        function v42.render(p44) -- Line: 269
            return nil;
        end;

        local v45 = createElement(v42);
        u1.mountVirtualNode(v45, nil, "WithDerivedState");
        expect(v41.callCount).to.equal(2);
        assertDeepEqual(u40(), {
            init = true,
            derived = true
        });
    end);
end;