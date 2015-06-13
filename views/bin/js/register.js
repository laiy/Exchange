(function() {
  $("#register").click(function(e) {
    var yy;
    e.preventDefault();
    yy = $.post('/signup', {
      param1: $('#InputName').value,
      param2: $('#InputIdCard').value,
      param3: $('#InputLocation').value,
      param4: $('#InputEmail').value
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
