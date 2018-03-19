({
    unrender: function (cmp) {
        this.superUnrender();
        window.removeEventListener("click", cmp.handleClick);
    },
});