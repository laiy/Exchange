(function() {
  $(function() {
    $("#tofo").click(function(e) {
      var yy;
      e.preventDefault();
      console.log("in");
      yy = $.post('/user', {
        param1: $('#uid').value,
        param2: 'fo'
      });
      return yy.done(function(data) {
        if (data.result) {
          if (data.result === 'success') {
            return alert('success');
          } else {
            return alert("fail");
          }
        }
      });
    });
    return $("#unfo").click(function(e) {
      var yy;
      e.preventDefault();
      console.log("in");
      yy = $.post('/user', {
        param1: $('#uid').value,
        param2: 'unfo'
      });
      return yy.done(function(data) {
        if (data.result) {
          if (data.result === 'success') {
            return alert('success');
          } else {
            return alert("fail");
          }
        }
      });
    });
  });

   $('#log-out').click(function() {
       return $.ajax({
           url: '/Log/session',
           type: 'delete',
           success: function(data) {
               if (data.result === 'success') {
                    return $(location).attr('href', '/');
               } else {
                    return alert('fail!');
               }
           }
       });
   });


}).call(this);
