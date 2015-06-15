$ ->
    $("#tofo").click (e) ->
        e.preventDefault()
        console.log "in"
    #name, idCard, loc, email
        yy=$.post('/user', 
            param1: $('#uid').value, 
            param2: 'fo')
        
        yy.done (data) ->
            if data.result
                if (data.result == 'success')
                	alert 'success'
                else
                    alert "fail"

    $("#unfo").click (e) ->
        e.preventDefault()
        console.log "in"
    #name, idCard, loc, email
        yy=$.post('/user', 
            param1: $('#uid').value, 
            param2: 'unfo')
        
        yy.done (data) ->
            if data.result
                if (data.result == 'success')
                    alert 'success'
                else
                    alert "fail"
