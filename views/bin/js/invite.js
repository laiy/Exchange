(function() {
    $('#send-button').click(function() {
        var wish = $(this).attr('wish-id');
        var msg = $('#remark').val();
        return $.post('/invite', {
            wish: wish,
            msg: msg
        }, function(data) {
            alert(data.result + '\n' + (data.msg ? data.msg : void 0));
            if (data.result === 'success') {
                return window.location.replace("/");
            }
        });
    });
}).call(this);
