$(function () {
    $(document).on("click", '.pagination a', null, function () {
        $.get(this.href, null, null, 'script');
        return false;
    });
});
