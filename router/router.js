const express = require("express");
const router = express.Router();
const controller = require("../controller/controller");
const AdminController = require("../controller/AdminController");

// Public API
router.get("/getHirek", controller.getHirek);

// Admin Authentication
router.get("/administrator", (req, res) => res.render("login", { error: null }));
router.post("/administrator/login", AdminController.loginAdmin);

// Admin Dashboard (Protected)
router.get("/administrator/console", AdminController.isAuthenticated, AdminController.getConsole);
router.post("/administrator/save", AdminController.isAuthenticated, AdminController.upload.single('image'), AdminController.saveArticle);
router.get("/administrator/edit/:id", AdminController.isAuthenticated, AdminController.editArticleView);
router.get("/administrator/delete/:id", AdminController.isAuthenticated, AdminController.deleteArticle);

module.exports = router;
