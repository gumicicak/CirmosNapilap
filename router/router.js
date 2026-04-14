const express = require("express");
const router = express.Router();
const controller = require("../controller/controller");
const newsController = require("../controller/newsController");

// Public API
router.get("/getHirek", controller.getHirek);

// Admin Authentication
router.get("/administrator", (req, res) => res.render("login", { error: null }));
router.post("/administrator/login", newsController.loginAdmin);

// Admin Dashboard (Protected)
router.get("/administrator/console", newsController.isAuthenticated, newsController.getConsole);
router.post("/administrator/save", newsController.isAuthenticated, newsController.upload.single('image'), newsController.saveArticle);
router.get("/administrator/edit/:id", newsController.isAuthenticated, newsController.editArticleView);
router.get("/administrator/delete/:id", newsController.isAuthenticated, newsController.deleteArticle);

module.exports = router;