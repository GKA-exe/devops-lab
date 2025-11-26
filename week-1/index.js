const express = require("express");
const cors = require("cors");
const app = express();

app.use(cors());
app.use(express.json());

let items = [];

app.get("/", (req, res) => {
  res.send("Welcome to the Item Management API");
});

app.get("/welcome", (req, res) => {
  res.json({ message: "Welcome page welcomes you" });
});

app.get("/items", (req, res) => {
  res.json(items);
});

app.post("/items", (req, res) => {
  if (!req.body.name || req.body.name.trim() === "") {
    return res.status(400).json({ message: "Name is required" });
  }

  const newItem = { id: Date.now(), name: req.body.name.trim() };
  items.push(newItem);
  res.status(201).json(newItem);
});

app.patch("/items/:id", (req, res) => {
  if (!req.body.name || req.body.name.trim() === "") {
    return res.status(400).json({ message: "Name is required" });
  }

  const item = items.find((i) => i.id === parseInt(req.params.id));
  if (item) {
    item.name = req.body.name.trim();
    res.json(item);
  } else {
    res.status(404).json({ message: "Item not found" });
  }
});

app.delete("/items/:id", (req, res) => {
  const initialLength = items.length;
  items = items.filter((i) => i.id !== parseInt(req.params.id));

  if (items.length === initialLength) {
    return res.status(404).json({ message: "Item not found" });
  }
  res.json({ message: "Item deleted" });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
