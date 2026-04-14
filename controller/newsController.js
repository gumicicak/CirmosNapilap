const db = require('../model/model'); 
const crypto = require('crypto');
const multer = require('multer');
const path = require('path');

// --- MULTER CONFIGURATION ---
const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, './public/images'),
  filename: (req, file, cb) => cb(null, Date.now() + path.extname(file.originalname))
});
exports.upload = multer({ storage: storage });

// --- AUTH MIDDLEWARE ---
exports.isAuthenticated = (req, res, next) => {
  if (req.session && req.session.isAdmin) return next();
  res.redirect('/administrator');
};

// --- ADMIN FUNCTIONS ---
exports.loginAdmin = async (req, res) => {
  const { username, password } = req.body;
  try {
    const hashedInput = crypto.createHash('sha256').update(password).digest('hex');
    const [rows] = await db.query(`SELECT * FROM writers WHERE name = ? AND password = ?`, [username, hashedInput]);

    if (rows.length > 0) {
      req.session.isAdmin = true;
      res.redirect('/administrator/console');
    } else {
      res.render('login', { error: 'Hibás Felhasználónév/Jelszó' });
    }
  } catch (err) {
    console.error('Login error:', err);
    res.status(500).render('login', { error: 'Server error' });
  }
};

exports.getConsole = async (req, res) => {
  const searchTerm = req.query.search || ''; 
  try {
    let articleQuery = `
      SELECT a.id, a.title, a.date, w.name as writer_name, c.name as category_name 
      FROM articles a
      JOIN writers w ON a.writer_id = w.id 
      JOIN category c ON a.category_id = c.id `;
    
    let queryParams = [];
    if (searchTerm) {
      articleQuery += ` WHERE a.title LIKE ?`;
      queryParams.push(`%${searchTerm}%`);
    }
    articleQuery += ` ORDER BY a.date DESC`;
    
    const [articles] = await db.query(articleQuery, queryParams);
    const [writers] = await db.query("SELECT id, name FROM writers");
    const [categories] = await db.query("SELECT id, name FROM category");

    res.render('adminConsole', { articles, writers, categories, editingArticle: null, searchTerm });
  } catch (err) {
    console.error('Console error:', err);
    res.status(500).send('Server error');
  }
};

exports.editArticleView = async (req, res) => {
  const searchTerm = req.query.search || '';
  try {
    const [writers] = await db.query("SELECT id, name FROM writers");
    const [categories] = await db.query("SELECT id, name FROM category");
    const [target] = await db.query("SELECT * FROM articles WHERE id = ?", [req.params.id]);
    
    let articleQuery = `SELECT a.id, a.title, a.date, w.name as writer_name, c.name as category_name FROM articles a JOIN writers w ON a.writer_id = w.id JOIN category c ON a.category_id = c.id `;
    let queryParams = [];
    if (searchTerm) {
      articleQuery += ` WHERE a.title LIKE ?`;
      queryParams.push(`%${searchTerm}%`);
    }
    articleQuery += ` ORDER BY a.date DESC`;
    const [articles] = await db.query(articleQuery, queryParams);

    res.render('adminConsole', { articles, writers, categories, editingArticle: target[0], searchTerm });
  } catch (err) {
    console.error('Edit view error:', err);
    res.status(500).send('Server error');
  }
};

exports.saveArticle = async (req, res) => {
  const { id, title, text, writer_id, category_id } = req.body;
  const currentDate = new Date().toISOString().slice(0, 19).replace('T', ' ');
  let finalClientText = text;

  if (req.file) {
    finalClientText = `${req.file.filename}- ${text}`;
  }

  try {
    if (id) {
      await db.query("UPDATE articles SET title=?, text=?, writer_id=?, category_id=?, date=? WHERE id=?", 
        [title, finalClientText, writer_id, category_id, currentDate, id]);
    } else {
      await db.query("INSERT INTO articles (title, text, writer_id, category_id, date) VALUES (?,?,?,?,?)", 
        [title, finalClientText, writer_id, category_id, currentDate]);
    }
    res.redirect('/administrator/console');
  } catch (err) {
    console.error('Save error:', err);
    res.status(500).send('Server error');
  }
};

exports.deleteArticle = async (req, res) => {
  try {
    await db.query("DELETE FROM articles WHERE id = ?", [req.params.id]);
    res.redirect('/administrator/console');
  } catch (err) {
    console.error('Delete error:', err);
    res.status(500).send('Server error');
  }
};
