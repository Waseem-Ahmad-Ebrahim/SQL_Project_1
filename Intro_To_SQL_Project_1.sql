-- Create the Authors table
CREATE TABLE "Authors" (
	"Author_ID"	INTEGER,
	"First_Name"	TEXT NOT NULL,
	"Last_Name"	TEXT NOT NULL,
	"Nationality"	TEXT NOT NULL CHECK("Nationality" IN ("American", "British", "German", "South African", "Chinese", "Other")),
	PRIMARY KEY("Author_ID" AUTOINCREMENT)
);

-- Create the Books table
CREATE TABLE "Books" (
	"Book_ID"	INTEGER,
	"Title"	TEXT NOT NULL,
	"Description"	TEXT,
	"Author_ID"	INTEGER,
	PRIMARY KEY("Book_ID" AUTOINCREMENT),
	FOREIGN KEY("Author_ID") REFERENCES "Authors"("Author_ID")
);

-- Insert data into Authors
INSERT INTO Authors (First_Name, Last_Name, Nationality) VALUES
("Nelson", "Mandela", "South African"),
("Albert", "Einstein", "German"),
("George", "Orwell", "British"),
("William", "Shakespeare", "British"),
("Stephen", "King", "American");

-- Insert data into Books
INSERT INTO Books (Title, Description, Author_ID) VALUES
("A Long Walk to Freedom", "Autobiography of Nelson Mandela", 1),
("The Theory of Everything", "A book on modern physics", 2),
("Understanding Quantum Mechanics", "An introduction to quantum theory", 2),
("Carrie", "A high school girl with telekinetic powers seeks revenge after being humiliated at prom.", 5),
("Romeo and Juliet", "A tragic love story about two young lovers from feuding families whose romance ends in catastrophe.", 4),
("The Shining", "A family faces supernatural horrors and a descent into madness at an isolated hotel.", 5),
("Macbeth", "A dark tale of ambition and betrayal, following a Scottish general’s rise to power and his subsequent fall into tyranny and madness", 4),
("Animal Farm", "An allegorical novella that uses a farm's animal rebellion against human farmers to critique the rise of totalitarianism and the corruption of revolutionary ideals.", 3),
("1984", "A dystopian novel about a totalitarian regime that uses surveillance, censorship, and propaganda to control its citizens, focusing on one man's struggle against the oppressive system.", 3),
("Hamlet", "A tragedy about Prince Hamlet of Denmark, who seeks revenge against his uncle Claudius for murdering his father and usurping the throne, leading to a complex tale of madness, betrayal, and moral conflict.", 4);

-- Count how many books there are in total
SELECT COUNT(*) AS Total_Books FROM Books;

-- Find out which author has the most books
SELECT a.First_Name, a.Last_Name, COUNT(b.Book_ID) AS Number_Of_Books
FROM Authors a
JOIN Books b ON a.Author_ID = b.Author_ID
GROUP BY a.Author_ID
ORDER BY Number_Of_Books DESC
LIMIT 1;

-- Find out how many books there are according to nationality
SELECT a.Nationality, COUNT(b.Book_ID) AS Number_Of_Books
FROM Authors a
JOIN Books b ON a.Author_ID = b.Author_ID
GROUP BY a.Nationality;