(function() {
  $(function() {
    $("#tofo").click(function(e) {
      var yy;
      e.preventDefault();
      console.log($('#uid').val());
      yy = $.post('/user', {
        uid: $('#idcard').val(),
        op: 'fo'
      });
      yy.done(function(data) {
        if (data.result) {
          if (data.result === 'success') {
            alert("success");
            window.location.replace("/list/" + $("#uid").val());
          } else {
            alert("fail");
          }
        }
      });
      yy.complete(function(){
        console.log('hehe');
      });
    });
    $("#unfo").click(function(e) {
      var yy;
      e.preventDefault();
      console.log("in");
      yy = $.post('/user', {
        uid: $('#idcard').val(),
        op: 'unfo'
      });
      yy.done(function(data) {
        if (data.result) {
          if (data.result === 'success') {
            alert('success');
            window.location.replace("/list/" + $("#uid").val());
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
