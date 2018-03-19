({
    destroyPill: function (component, event, helper) {
        let isNotStrikeDemo = component.getElement().parentElement.classList[0] !== 'strikeDemoOnly';
        if (component.get('v.destroyable') && isNotStrikeDemo) {
            helper.notifyParent(component);
            helper.destroyComponent(component);
        }
    }
})