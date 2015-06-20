(function() {
  $("#register").click(function(e) {
    var yy;
    e.preventDefault();
    yy = $.post('/signup', {
      name: $('#InputName').val(),
      idCard: $('#InputIdCard').val(),
      loc: $('#InputLocation').val(),
      email: $('#InputEmail').val()
    });
    return yy.done(function(data) {
      if (data.result) {
        if (data.result === 'success') {
          alert("success");
          return window.location.replace("/log");
        } else if (data.result === 'fail') {
          return alert(data.msg);
        }
      }
    });
  });

}).call(this);
