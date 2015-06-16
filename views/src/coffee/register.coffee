$("#register").click (e) ->
    e.preventDefault()

#name, idCard, loc, email
    yy=$.post('/signup',
        param1: $('#InputName').value,
        param2: $('#InputIdCard').value,
        param3: $('#InputLocation').value,
        param4: $('#InputEmail').value)

    yy.done (data) ->
        if data.result
            if (data.result == 'success')
                window.location.replace "/"
            else if (data.result == 'fail')
                alert data.msg
