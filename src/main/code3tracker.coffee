express = require('express')
fs = require("fs")

x = fs.readdirSync("./")
console.log("x")
console.log(x)
router = require("./router")
app = express()

router.init(app)

app.listen 3000 