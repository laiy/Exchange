mockData = new Object

mockData.invite = {
    uid: 'asksfaklsfhasf',
    wid: 'asksfaklsfhasf',
    sendTime: Date.now(),
    remark: 'this is a remark',
    stat: 'Waitin',
    replyTime: Date.now(),
    replyMsg: 'this is a reply'
}

mockData.wish = {
    uid: 'asksfaklsfhasf',
    stt: Date.now(),
    loc: 'fhaksjfhasfaf',
    ddl: Date.now(),
    title: 'fuck',
    desc: 'okay'
}

mockData.wishes = [
    mockData.wish,
    mockData.wish,
    mockData.wish,
    mockData.wish,
    mockData.wish
]

mockData.usr = {
    email: '233@qq.com',
    name: 'hello',
    idCard: '91286901284719024781924871',
    loc: 'SYSU',
    fans: [
        {
            email: '233@qq.com',
            name: 'hello',
            idCard: '91286901284719024781924871',
            loc: 'SYSU'
        },
        {
            email: '233@qq.com',
            name: 'hello',
            idCard: '91286901284719024781924871',
            loc: 'SYSU'
        },
        {
            email: '233@qq.com',
            name: 'hello',
            idCard: '91286901284719024781924871',
            loc: 'SYSU'
        }
    ],
    following: [
        {
            email: '233@qq.com',
            name: 'hello',
            idCard: '91286901284719024781924871',
            loc: 'SYSU'
        },
        {
            email: '233@qq.com',
            name: 'hello',
            idCard: '91286901284719024781924871',
            loc: 'SYSU'
        },
        {
            email: '233@qq.com',
            name: 'hello',
            idCard: '91286901284719024781924871',
            loc: 'SYSU'
        }
    ]
}

module.exports = mockData
