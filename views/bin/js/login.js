(function() {
  $("#login").click(function(e) {
    var yy;
    e.preventDefault();
    yy = $.post('/log/session', {
      param1: $('#InputIdCard').value
    });
    return yy.done(function(data) {
      if (data.result) {
        if (data.result === 'success') {
          return window.location.replace("/");
        } else if (data.result === 'fail') {
          return alert(data.msg);
        }
      }
    });
  });

}).call(this);
