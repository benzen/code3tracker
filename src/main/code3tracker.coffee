db = require("./db")
express = require('express')
router = require("./router")
app = express()

router.init(app)

app.listen 3000 