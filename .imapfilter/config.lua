-- local inspect = require('inspect')
--
status, password = pipe_from('pass fastmail-auto')
cc4m = IMAP {
    server = 'imap.fastmail.com',
    username = 'cc4m@fastmail.com',
    password = password,
    ssl = 'ssl3'
}

-- Move messages that have been read and are older than a day to Arcive
results = cc4m.INBOX:is_seen() +
    cc4m.INBOx:is_older(1)
results:move_messages(cc4m.Archive)
