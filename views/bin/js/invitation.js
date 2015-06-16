(function() {
    $('#agree').click(function() {
        var wid = $(this).attr("wid");
        var iid = $(this).attr("iid");
        var msg = $('#remark').val();
        $.post('/invitation', {
            wid: wid,
            iid: iid,
            msg: msg,
            ref: false
        }, function(data) {
            alert(data.result + '\n' + (data.msg ? data.msg : void 0));
            if (data.result === 'success') {
                return window.location.replace("/");
            }
        });
    });
    $('#disagree').click(function() {
        var wid = $(this).attr("wid");
        var iid = $(this).attr("iid");
        var msg = $('#remark').val();
        $.post('/invitation', {
            wid: wid,
            iid: iid,
            msg: msg,
            ref: true
        }, function(data) {
            alert(data.result + '\n' + (data.msg ? data.msg : void 0));
            if (data.result === 'success') {
                return window.location.replace("/");
            }
        });
    });
}).call(this);
