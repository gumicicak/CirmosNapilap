const express = require("express");
const path = require("path");
const bodyParser = require("body-parser");
const session = require("express-session"); // npm install express-session
const router = require("./router/router");

const app = express();

// Set up EJS for rendering admin pages
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Session for administrator authentication
app.use(session({
    secret: 'cat-news-secret',
    resave: false,
    saveUninitialized: true
}));

app.use(express.static("public"));

// Use the consolidated router
app.use("/", router);

app.listen(3000, () => {
    console.log("Server running at http://localhost:3000");
});