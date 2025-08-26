import express from "express";
import { PrismaClient } from "@prisma/client";
import path from "path";
import bodyParser from "body-parser";

const prisma = new PrismaClient();
const app = express();

app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", async (req, res) => {
  const users = await prisma.user.findMany();
  res.render("index", { users });
});

app.post("/add-user", async (req, res) => {
  const { name, email } = req.body;
  if (name && email) {
    await prisma.user.create({
      data: { name, email },
    });
  }
  res.redirect("/");
});

app.listen(3000, () => console.log("Server running on port 3000"));
