const db = require("../model/model");

const getHirek = async (req, res) => {
    try {
        const [rows] = await db.query(`
            SELECT 
                articles.id, 
                articles.date, 
                articles.title, 
                articles.text, 
                category.name AS category, 
                writers.name AS writer
            FROM articles
            JOIN category ON articles.category_id = category.id
            JOIN writers ON articles.writer_id = writers.id
            ORDER BY articles.date DESC
        `);
        res.status(200).json(rows);
    } catch (error) {
        console.error("Database error:", error);
        res.status(500).json({ message: "Error fetching news data" });
    }
};

module.exports = {
    getHirek
};