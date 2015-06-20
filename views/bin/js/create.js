(function() {
  $(function() {
// title, stt, ddl, loc, desc    
    $("#create").click(function(e) {
      var yy;
      e.preventDefault();
      console.log("in");
      yy = $.post('/create', {
        title: $('#title').val(),
        stt: $('#stt').val(),
        ddl: $('#ddl').val(),
        loc: $('#loc').val(),
        desc: $('#desc').val()
      });
      yy.done(function(data) {
        if (data.result) {
          if (data.result === 'success') {
            alert('success');
            window.location.replace("/");
          } else {
            alert("fail");
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

