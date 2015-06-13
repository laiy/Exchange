$("#login").click (e) ->
    e.preventDefault()

    yy=$.post('/log/session', param1: $('#InputIdCard').value)
    
    yy.done (data) ->
        if (data.result == 'success')
            window.location.replace "/"
        else if (data.result == 'fail')
            alert "Wrong idCard"