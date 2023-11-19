/* These are exercises that I've done during learning SQL */

/* What are your favorite books? You can make a database table to store them in! In this first step, create a table to store your list of books. It should have columns for id, name, and rating.
Now, add three of your favorite books into the table. */

INSERT INTO books VALUES (1, "My book no.1", 5);
INSERT INTO books VALUES (2, "TADA", 3);
INSERT INTO books VALUES (3, "BADAM", 4);


/* This database contains an incomplete list of box office hits and their release year. In this challenge, you're going to get the results back out of the database in different ways! In this first step, just select all the movies.
Now, add a second query after the first, that retrieves only the movies that were released in the year 2000 or later, not before. Sort the results so that the earlier movies are listed first. You should have 2 SELECT statements after this step. */

CREATE TABLE movies (id INTEGER PRIMARY KEY, name TEXT, release_year INTEGER);
INSERT INTO movies VALUES (1, "Avatar", 2009);
INSERT INTO movies VALUES (2, "Titanic", 1997);
INSERT INTO movies VALUES (3, "Star Wars: Episode IV - A New Hope", 1977);
INSERT INTO movies VALUES (4, "Shrek 2", 2004);
INSERT INTO movies VALUES (5, "The Lion King", 1994);
INSERT INTO movies VALUES (6, "Disney's Up", 2009);
 
 
SELECT * FROM movies;
SELECT * FROM movies WHERE release_year > 2000 ORDER BY release_year ASC;


/* Here's a table containing a TODO list with the number of minutes it will take to complete each item. Insert another item to your todo list with the estimated minutes it will take.
Select the SUM of minutes it will take to do all of the items on your TODO list. You should only have one SELECT statement. */

CREATE TABLE todo_list (id INTEGER PRIMARY KEY, item TEXT, minutes INTEGER);
INSERT INTO todo_list VALUES (1, "Wash the dishes", 15);
INSERT INTO todo_list VALUES (2, "vacuuming", 20);
INSERT INTO todo_list VALUES (3, "Learn some stuff on KA", 30);
INSERT INTO todo_list VALUES (4, "Read a book", 60);

SELECT SUM(minutes) FROM todo_list;


/* Create your own store! Your store should sell one type of things, like clothing or bikes, whatever you want your store to specialize in. You should have a table for all the items in your store, and at least 5 columns for the kind of data you think you'd need to store. You should sell at least 15 items, and use select statements to order your items by price and show at least one statistic about the items. */

CREATE TABLE inventory (id INTEGER PRIMARY KEY, name TEXT, price INTEGER, quantity INTEGER, category TEXT);

INSERT INTO inventory VALUES (1, "Brush", 4, 50, "accessory");
INSERT INTO inventory VALUES (2, "Charcoal", 7, 200, "accessory");
INSERT INTO inventory VALUES (3, "Bowl", 20, 150, "accessory");
INSERT INTO inventory VALUES (4, "Hose", 3, 40, "accessory");
INSERT INTO inventory VALUES (5, "Charcoal burner", 50, 20, "accessory");
INSERT INTO inventory VALUES (6, "Glass", 40, 30, "accessory");
INSERT INTO inventory VALUES (7, "HMD", 40, 100, "accessory");
INSERT INTO inventory VALUES (8, "Tong", 10, 50, "accessory");
INSERT INTO inventory VALUES (9, "Basket", 15, 30, "accessory");
INSERT INTO inventory VALUES (10, "Mouthpiece", 16, 100, "accessory");
INSERT INTO inventory VALUES (11, "Mouthtip", 2, 300, "accessory");
INSERT INTO inventory VALUES (12, "Foil", 5, 30, "accessory");
INSERT INTO inventory VALUES (13, "Moze Breeze Pro", 199, 15, "shisha");
INSERT INTO inventory VALUES (14, "Moze Sphere 2", 250, 15, "shisha");
INSERT INTO inventory VALUES (15, "Moze Varity", 200, 10, "shisha");
INSERT INTO inventory VALUES (16, "Steamulation Ultimate", 399, 8, "shisha");
INSERT INTO inventory VALUES (17, "Aeon Lounge 3", 230, 10, "shisha");

SELECT * FROM inventory WHERE category = "shisha" ORDER BY price ASC;

SELECT category, SUM(quantity) FROM inventory WHERE category = "shisha";


/* Ever sung karaoke? It's a place where you sing songs with your friends, and it's a lot of fun. We've created a table with songs, and in this challenge, you'll use queries to decide what songs to sing. For the first step, select all the song titles.
Maybe your friends only like singing either recent songs or truly epic songs. Add another SELECT that uses OR to show the titles of the songs that have an 'epic' mood or a release date after 1990.
(Tip: If you're not sure how to select rows where a column equals a value, remember that you can check the documentation below.)
People get picky at the end of the night. Add another SELECT that uses AND to show the titles of songs that are 'epic', and released after 1990, and less than 4 minutes long.
Note that the duration column is measured in seconds. */

CREATE TABLE songs (
    id INTEGER PRIMARY KEY,
    title TEXT,
    artist TEXT,
    mood TEXT,
    duration INTEGER,
    released INTEGER);
    
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Bohemian Rhapsody", "Queen", "epic", 60, 1975);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Let it go", "Idina Menzel", "epic", 227, 2013);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("I will survive", "Gloria Gaynor", "epic", 198, 1978);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Twist and Shout", "The Beatles", "happy", 152, 1963);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("La Bamba", "Ritchie Valens", "happy", 166, 1958);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("I will always love you", "Whitney Houston", "epic", 273, 1992);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Sweet Caroline", "Neil Diamond", "happy", 201, 1969);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Call me maybe", "Carly Rae Jepsen", "happy", 193, 2011);

SELECT title FROM songs;    
SELECT title FROM songs WHERE mood = "epic" OR released > 1990;
SELECT title FROM songs WHERE mood = "epic" AND released > 1990 AND duration < 240;


/* We've created a database of songs and artists, and you'll make playlists from them in this challenge. In this first step, select the title of all the songs by the artist named 'Queen'.
Now you'll make a 'Pop' playlist. In preparation, select the name of all of the artists from the 'Pop' genre.
(Tip: Make sure you type it 'Pop', SQL considers that different from 'pop'.)
To finish creating the 'Pop' playlist, add another query that will select the title of all the songs from the 'Pop' artists. It should use IN on a nested subquery that's based on your previous query. */

CREATE TABLE artists (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    country TEXT,
    genre TEXT);

INSERT INTO artists (name, country, genre)
    VALUES ("Taylor Swift", "US", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Led Zeppelin", "US", "Hard rock");
INSERT INTO artists (name, country, genre)
    VALUES ("ABBA", "Sweden", "Disco");
INSERT INTO artists (name, country, genre)
    VALUES ("Queen", "UK", "Rock");
INSERT INTO artists (name, country, genre)
    VALUES ("Celine Dion", "Canada", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Meatloaf", "US", "Hard rock");
INSERT INTO artists (name, country, genre)
    VALUES ("Garth Brooks", "US", "Country");
INSERT INTO artists (name, country, genre)
    VALUES ("Shania Twain", "Canada", "Country");
INSERT INTO artists (name, country, genre)
    VALUES ("Rihanna", "US", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Guns N' Roses", "US", "Hard rock");
INSERT INTO artists (name, country, genre)
    VALUES ("Gloria Estefan", "US", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Bob Marley", "Jamaica", "Reggae");

CREATE TABLE songs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    artist TEXT,
    title TEXT);

INSERT INTO songs (artist, title)
    VALUES ("Taylor Swift", "Shake it off");
INSERT INTO songs (artist, title)
    VALUES ("Rihanna", "Stay");
INSERT INTO songs (artist, title)
    VALUES ("Celine Dion", "My heart will go on");
INSERT INTO songs (artist, title)
    VALUES ("Celine Dion", "A new day has come");
INSERT INTO songs (artist, title)
    VALUES ("Shania Twain", "Party for two");
INSERT INTO songs (artist, title)
    VALUES ("Gloria Estefan", "Conga");
INSERT INTO songs (artist, title)
    VALUES ("Led Zeppelin", "Stairway to heaven");
INSERT INTO songs (artist, title)
    VALUES ("ABBA", "Mamma mia");
INSERT INTO songs (artist, title)
    VALUES ("Queen", "Bicycle Race");
INSERT INTO songs (artist, title)
    VALUES ("Queen", "Bohemian Rhapsody");
INSERT INTO songs (artist, title)
    VALUES ("Guns N' Roses", "Don't cry");
    
SELECT title FROM songs WHERE artist = "Queen";
SELECT name FROM artists WHERE genre = "Pop";

SELECT title FROM songs where artist IN (
    SELECT name FROM artists WHERE genre = "Pop");


/* We've created a database of a few popular authors and their books, with word counts for each book. In this first step, select all the authors who have written more than 1 million words, using GROUP BY and HAVING. Your results table should include the 'author' and their total word count as a 'total_words' column.
Now select all the authors that write more than an average of 150,000 words per book. Your results table should include the 'author' and average words as an 'avg_words' column. */

CREATE TABLE books (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    author TEXT,
    title TEXT,
    words INTEGER);
    
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Philosopher's Stone", 79944);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Chamber of Secrets", 85141);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Prisoner of Azkaban", 107253);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Goblet of Fire", 190637);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Order of the Phoenix", 257045);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Half-Blood Prince", 168923);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Deathly Hallows", 197651);

INSERT INTO books (author, title, words)
    VALUES ("Stephenie Meyer", "Twilight", 118501);
INSERT INTO books (author, title, words)
    VALUES ("Stephenie Meyer", "New Moon", 132807);
INSERT INTO books (author, title, words)
    VALUES ("Stephenie Meyer", "Eclipse", 147930);
INSERT INTO books (author, title, words)
    VALUES ("Stephenie Meyer", "Breaking Dawn", 192196);
    
INSERT INTO books (author, title, words)
    VALUES ("J.R.R. Tolkien", "The Hobbit", 95022);
INSERT INTO books (author, title, words)
    VALUES ("J.R.R. Tolkien", "Fellowship of the Ring", 177227);
INSERT INTO books (author, title, words)
    VALUES ("J.R.R. Tolkien", "Two Towers", 143436);
INSERT INTO books (author, title, words)
    VALUES ("J.R.R. Tolkien", "Return of the King", 134462);
    

SELECT author, SUM(words) AS total_words FROM books GROUP BY author HAVING SUM(words) > 1000000;

SELECT author, AVG(words) AS avg_words FROM books GROUP BY author HAVING avg_words > 150000;


/* We've created a database to track student grades, with their name, number grade, and what percent of activities they've completed. In this first step, select all of the rows, and display the name, number_grade, and percent_completed, which you can compute by multiplying and rounding the fraction_completed column.
Now, this step is a little tricky. The goal is a table that shows how many students have earned which letter_grade. You can output the letter_grade by using CASE with the number_grade column, outputting 'A' for grades > 90, 'B' for grades > 80, 'C' for grades > 70, and 'F' otherwise. Then you can use COUNT with GROUP BY to show the number of students with each of those grades. */

CREATE TABLE student_grades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    number_grade INTEGER,
    fraction_completed REAL);
    
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winston", 90, 0.805);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winnefer", 95, 0.901);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winsteen", 85, 0.906);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Wincifer", 66, 0.7054);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winster", 76, 0.5013);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winstonia", 82, 0.9045);

SELECT name, number_grade, ROUND(fraction_completed * 100) AS percent_completed FROM student_grades;

SELECT COUNT(*),
    CASE
        WHEN number_grade > 90 THEN "A"
        WHEN number_grade <= 90 AND number_grade > 80 THEN "B"
        WHEN number_grade <= 80 AND number_grade > 70 THEN "C"
        ELSE "F"
    END as "letter_grade"
FROM student_grades
GROUP BY letter_grade;


/* 
Pick one of those data sets or create a data set like that, and use advanced SELECT queries to discover things about the data. What sort of questions might one have about that data, like if they were using it for an app or a business idea? Here are some ideas:

What are average, max, and min values in the data?
What about those numbers per category in the data (using HAVING)?
What ways are there to group the data values that don’t exist yet (using CASE)?
What interesting ways are there to filter the data (using AND/OR)? */

CREATE TABLE topmovies(
   Rank        INTEGER,
   Title       TEXT,
   Studio      TEXT,
   Worldwide   REAL,
   Domestic    REAL,
   DomesticPct REAL,
   Overseas    REAL,
   OverseasPct REAL,
   Year        INTEGER
);

INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (1,'Avatar','Fox',2788.00,760.50,0.27,2027.50,0.73,2009);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (2,'Titanic','Par.',2186.80,658.70,0.30,1528.10,0.70,1997);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (3,'Marvel''s The Avengers','BV',1518.60,623.40,0.41,895.20,0.59,2012);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (4,'Harry Potter and the Deathly Hallows Part 2','WB',1341.50,381.00,0.28,960.50,0.72,2011);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (5,'Furious 7','Uni.',1322.20,321.20,0.24,1001.00,0.76,2015);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (6,'Frozen','BV',1274.20,400.70,0.31,873.50,0.69,2013);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (7,'Iron Man 3','BV',1215.40,409.00,0.34,806.40,0.66,2013);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (8,'Transformers: Dark of the Moon','P/DW',1123.80,352.40,0.31,771.40,0.69,2011);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (9,'The Lord of the Rings: The Return of the King','NL',1119.90,377.80,0.34,742.10,0.66,2003);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (10,'Skyfall','Sony',1108.60,304.40,0.28,804.20,0.73,2012);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (11,'Transformers: Age of Extinction','Par.',1091.40,245.40,0.23,846.00,0.78,2014);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (12,'The Dark Knight Rises','WB',1084.40,448.10,0.41,636.30,0.59,2012);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (13,'Pirates of the Caribbean: Dead Man''s Chest','BV',1066.20,423.30,0.40,642.90,0.60,2006);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (14,'Toy Story 3','BV',1063.20,415.00,0.39,648.20,0.61,2010);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (15,'Pirates of the Caribbean: On Stranger Tides','BV',1045.70,241.10,0.23,804.60,0.77,2011);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (16,'Jurassic Park','Uni.',1029.20,402.50,0.39,626.70,0.61,1993);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (17,'Star Wars: Episode I - The Phantom Menace','Fox',1027.00,474.50,0.46,552.50,0.54,1999);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (18,'Alice in Wonderland (2010)','BV',1025.50,334.20,0.33,691.30,0.67,2010);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (19,'The Hobbit: An Unexpected Journey','WB',1017.00,303.00,0.30,714.00,0.70,2012);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (20,'The Dark Knight','WB',1004.60,534.90,0.53,469.70,0.47,2008);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (21,'The Lion King','BV',987.50,422.80,0.43,564.70,0.57,1994);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (22,'Harry Potter and the Sorcerer''s Stone','WB',974.80,317.60,0.33,657.20,0.67,2001);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (23,'Despicable Me 2','Uni.',970.80,368.10,0.38,602.70,0.62,2013);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (24,'Pirates of the Caribbean: At World''s End','BV',963.40,309.40,0.32,654.00,0.68,2007);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (25,'The Hobbit: The Desolation of Smaug','WB',960.40,258.40,0.27,702.00,0.73,2013);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (26,'Harry Potter and the Deathly Hallows Part 1','WB',960.30,296.00,0.31,664.30,0.69,2010);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (27,'The Hobbit: The Battle of the Five Armies','WB',955.10,255.10,0.27,700.00,0.73,2014);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (28,'Harry Potter and the Order of the Phoenix','WB',939.90,292.00,0.31,647.90,0.69,2007);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (29,'Finding Nemo','BV',936.70,380.80,0.41,555.90,0.59,2003);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (30,'Harry Potter and the Half-Blood Prince','WB',934.40,302.00,0.32,632.50,0.68,2009);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (31,'The Lord of the Rings: The Two Towers','NL',926.00,342.60,0.37,583.50,0.63,2002);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (32,'Shrek 2','DW',919.80,441.20,0.48,478.60,0.52,2004);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (33,'Harry Potter and the Goblet of Fire','WB',896.90,290.00,0.32,606.90,0.68,2005);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (34,'Spider-Man 3','Sony',890.90,336.50,0.38,554.30,0.62,2007);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (35,'Ice Age: Dawn of the Dinosaurs','Fox',886.70,196.60,0.22,690.10,0.78,2009);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (36,'Harry Potter and the Chamber of Secrets','WB',879.00,262.00,0.30,617.00,0.70,2002);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (37,'Ice Age: Continental Drift','Fox',877.20,161.30,0.18,715.90,0.82,2012);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (38,'The Lord of the Rings: The Fellowship of the Ring','NL',871.50,315.50,0.36,556.00,0.64,2001);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (39,'The Hunger Games: Catching Fire','LGF',864.90,424.70,0.49,440.20,0.51,2013);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (40,'Star Wars: Episode III - Revenge of the Sith','Fox',848.80,380.30,0.45,468.50,0.55,2005);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (41,'Transformers: Revenge of the Fallen','P/DW',836.30,402.10,0.48,434.20,0.52,2009);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (42,'The Twilight Saga: Breaking Dawn Part 2','LG/S',829.70,292.30,0.35,537.40,0.65,2012);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (43,'Inception','WB',825.50,292.60,0.35,533.00,0.65,2010);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (44,'Spider-Man','Sony',821.70,403.70,0.49,418.00,0.51,2002);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (45,'Independence Day','Fox',817.40,306.20,0.38,511.20,0.63,1996);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (46,'Shrek the Third','P/DW',799.00,322.70,0.40,476.20,0.60,2007);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (47,'Harry Potter and the Prisoner of Azkaban','WB',796.70,249.50,0.31,547.10,0.69,2004);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (48,'E.T.: The Extra-Terrestrial','Uni.',792.90,435.10,0.55,357.80,0.45,1982);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (49,'Fast & Furious 6','Uni.',788.70,238.70,0.30,550.00,0.70,2013);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (50,'Indiana Jones and the Kingdom of the Crystal Skull','Par.',786.60,317.10,0.40,469.50,0.60,2008);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (51,'Spider-Man 2','Sony',783.80,373.60,0.48,410.20,0.52,2004);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (52,'Star Wars','Fox',775.40,461.00,0.60,314.40,0.41,1977);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (53,'Guardians of the Galaxy','BV',774.20,333.20,0.43,441.00,0.57,2014);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (54,'2012','Sony',769.70,166.10,0.22,603.60,0.78,2009);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (55,'Maleficent','BV',758.40,241.40,0.32,517.00,0.68,2014);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (56,'The Da Vinci Code','Sony',758.20,217.50,0.29,540.70,0.71,2006);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (57,'The Amazing Spider-Man','Sony',757.90,262.00,0.35,495.90,0.65,2012);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (58,'Shrek Forever After','P/DW',752.60,238.70,0.32,513.90,0.68,2010);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (59,'The Hunger Games: Mockingjay - Part 1','LGF',752.10,337.10,0.45,415.00,0.55,2014);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (60,'X-Men: Days of Future Past','Fox',748.10,233.90,0.31,514.20,0.69,2014);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (61,'Madagascar 3: Europe''s Most Wanted','P/DW',746.90,216.40,0.29,530.50,0.71,2012);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (62,'The Chronicles of Narnia: The Lion, the Witch and the Wardrobe','BV',745.00,291.70,0.39,453.30,0.61,2005);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (63,'Monsters University','BV',743.60,268.50,0.36,475.10,0.64,2013);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (64,'The Matrix Reloaded','WB',742.10,281.60,0.38,460.60,0.62,2003);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (65,'Up','BV',731.30,293.00,0.40,438.30,0.60,2009);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (66,'Gravity','WB',716.40,274.10,0.38,442.30,0.62,2013);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (67,'Captain America: The Winter Soldier','BV',714.80,259.80,0.36,455.00,0.64,2014);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (68,'The Twilight Saga: Breaking Dawn Part 1','Sum.',712.20,281.30,0.40,430.90,0.61,2011);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (69,'The Twilight Saga: New Moon','Sum.',709.80,296.60,0.42,413.20,0.58,2009);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (70,'Transformers','P/DW',709.70,319.20,0.45,390.50,0.55,2007);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (71,'The Amazing Spider-Man 2','Sony',709.00,202.90,0.29,506.10,0.71,2014);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (72,'Dawn of the Planet of the Apes','Fox',708.80,208.50,0.29,500.30,0.71,2014);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (73,'The Twilight Saga: Eclipse','Sum.',698.50,300.50,0.43,398.00,0.57,2010);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (74,'Mission: Impossible - Ghost Protocol','Par.',694.70,209.40,0.30,485.30,0.70,2011);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (75,'The Hunger Games','LGF',691.20,408.00,0.59,283.20,0.41,2012);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (76,'Forrest Gump','Par.',677.90,330.30,0.49,347.70,0.51,1994);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (77,'The Sixth Sense','BV',672.80,293.50,0.44,379.30,0.56,1999);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (78,'Interstellar','Par.',672.70,188.00,0.28,484.70,0.72,2014);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (79,'Man of Steel','WB',668.00,291.00,0.44,377.00,0.56,2013);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (80,'Kung Fu Panda 2','P/DW',665.70,165.20,0.25,500.40,0.75,2011);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (81,'Ice Age: The Meltdown','Fox',660.90,195.30,0.30,465.60,0.70,2006);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (82,'Pirates of the Caribbean: The Curse of the Black Pearl','BV',654.30,305.40,0.47,348.90,0.53,2003);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (83,'Big Hero 6','BV',652.00,222.40,0.34,429.60,0.66,2014);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (84,'Star Wars: Episode II - Attack of the Clones','Fox',649.40,310.70,0.48,338.70,0.52,2002);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (85,'Thor: The Dark World','BV',644.80,206.40,0.32,438.40,0.68,2013);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (86,'Kung Fu Panda','P/DW',631.70,215.40,0.34,416.30,0.66,2008);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (87,'The Incredibles','BV',631.40,261.40,0.41,370.00,0.59,2004);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (88,'Fast Five','Uni.',626.10,209.80,0.34,416.30,0.67,2011);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (89,'Hancock','Sony',624.40,227.90,0.37,396.40,0.64,2008);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (90,'MIB 3','Sony',624.00,179.00,0.29,445.00,0.71,2012);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (91,'Iron Man 2','Par.',623.90,312.40,0.50,311.50,0.50,2010);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (92,'Ratatouille','BV',623.70,206.40,0.33,417.30,0.67,2007);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (93,'How to Train Your Dragon 2','Fox',618.90,177.00,0.29,441.90,0.71,2014);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (94,'The Lost World: Jurassic Park','Uni.',618.60,229.10,0.37,389.60,0.63,1997);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (95,'The Passion of the Christ','NM',611.90,370.80,0.61,241.10,0.39,2004);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (96,'Mamma Mia!','Uni.',609.80,144.10,0.24,465.70,0.76,2008);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (97,'Life of Pi','Fox',609.00,125.00,0.21,484.00,0.80,2012);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (98,'Madagascar: Escape 2 Africa','P/DW',603.90,180.00,0.30,423.90,0.70,2008);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (99,'Casino Royale','Sony',599.00,167.40,0.28,431.60,0.72,2006);
INSERT INTO topmovies(Rank,Title,Studio,Worldwide,Domestic,DomesticPct,Overseas,OverseasPct,Year) VALUES (100,'Tangled','BV',591.80,200.80,0.34,391.00,0.66,2010);


SELECT Rank, Title, Studio, Year FROM topmovies WHERE Year > 2010 LIMIT 5;

SELECT MAX(Year) AS "Most recent", Rank, Title, Studio, Year FROM topmovies;

Select MIN(Worldwide) AS "Lowest Worldwide", Rank, Title, Studio, Worldwide FROM topmovies;

SELECT MAX(Worldwide) AS "Highest Worldwide per Studio", Title, Studio, Year from topmovies GROUP BY Studio ORDER BY MAX(Worldwide) DESC;

SELECT Count(*) AS "Number of movies after 2010 with Worldwide > 1000, per Studio", Studio, MIN(Worldwide), 
    CASE 
        WHEN Count(*) > 2 THEN "Great"
        WHEN Count(*) < 3 THEN "Less great"
        ELSE "Okay"
    END AS Rating
FROM topmovies WHERE Year > 2010 AND Worldwide > 1000 GROUP BY Studio ORDER BY (Count(*)) DESC;


/* We've created a database of people and hobbies, and each row in hobbies is related to a row in persons via the person_id column. In this first step, insert one more row in persons and then one more row in hobbies that is related to the newly inserted person.
Now, select the 2 tables with a join so that you can see each person's name next to their hobby.
Now, add an additional query that shows only the name and hobbies of 'Bobby McBobbyFace', using JOIN combined with WHERE. */

CREATE TABLE persons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    age INTEGER);
    
INSERT INTO persons (name, age) VALUES ("Bobby McBobbyFace", 12);
INSERT INTO persons (name, age) VALUES ("Lucy BoBucie", 25);
INSERT INTO persons (name, age) VALUES ("Banana FoFanna", 14);
INSERT INTO persons (name, age) VALUES ("Shish Kabob", 20);
INSERT INTO persons (name, age) VALUES ("Fluffy Sparkles", 8);

CREATE table hobbies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person_id INTEGER,
    name TEXT);
    
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");

INSERT INTO persons (name, age) VALUES ("Hooba Dooba", 59);
INSERT INTO hobbies (person_id, name) VALUES (5, "music");

SELECT persons.name, hobbies.name FROM persons JOIN hobbies ON persons.id = hobbies.person_id;

SELECT persons.name, hobbies.name FROM persons JOIN hobbies ON persons.id = hobbies.person_id WHERE persons.name = "Bobby McBobbyFace";


/* We've created a database for customers and their orders. Not all of the customers have made orders, however. Come up with a query that lists the name and email of every customer followed by the item and price of orders they've made. Use a LEFT OUTER JOIN so that a customer is listed even if they've made no orders, and don't add any ORDER BY.
Now, create another query that will result in one row per each customer, with their name, email, and total amount of money they've spent on orders. Sort the rows according to the total money spent, from the most spent to the least spent.
(Tip: You should always GROUP BY on the column that is most likely to be unique in a row.) */

CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT);
    
INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");
INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");

CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER,
    item TEXT,
    price REAL);

INSERT INTO orders (customer_id, item, price)
    VALUES (1, "Sonic Screwdriver", 1000.00);
INSERT INTO orders (customer_id, item, price)
    VALUES (2, "High Quality Broomstick", 40.00);
INSERT INTO orders (customer_id, item, price)
    VALUES (1, "TARDIS", 1000000.00);
    

SELECT customers.name, customers.email, orders.item, orders.price
FROM customers
LEFT OUTER JOIN orders
WHERE customers.id = orders.customer_id;

SELECT customers.name, customers.email, SUM(orders.price)
FROM customers
LEFT OUTER JOIN orders
WHERE customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY SUM(orders.price) DESC;


/* We've created a table with all the 'Harry Potter' movies, with a sequel_id column that matches the id of the sequel for each movie. Issue a SELECT that will show the title of each movie next to its sequel's title (or NULL if it doesn't have a sequel). */

CREATE TABLE movies (id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    released INTEGER,
    sequel_id INTEGER);

INSERT INTO movies 
    VALUES (1, "Harry Potter and the Philosopher's Stone", 2001, 2);
INSERT INTO movies 
    VALUES (2, "Harry Potter and the Chamber of Secrets", 2002, 3);
INSERT INTO movies 
    VALUES (3, "Harry Potter and the Prisoner of Azkaban", 2004, 4);
INSERT INTO movies 
    VALUES (4, "Harry Potter and the Goblet of Fire", 2005, 5);
INSERT INTO movies 
    VALUES (5, "Harry Potter and the Order of the Phoenix ", 2007, 6);
INSERT INTO movies 
    VALUES (6, "Harry Potter and the Half-Blood Prince", 2009, 7);
INSERT INTO movies 
    VALUES (7, "Harry Potter and the Deathly Hallows – Part 1", 2010, 8);
INSERT INTO movies 
    VALUES (8, "Harry Potter and the Deathly Hallows – Part 2", 2011, NULL);

SELECT movies.title, sequel.title FROM movies
LEFT OUTER JOIN movies sequel
ON movies.sequel_id = sequel.id;


/* We've created a database for a friend networking site, with a table storing data on each person, a table on each person's hobbies, and a table of friend connections between the people. In this first step, use a JOIN to display a table showing people's names with their hobbies.
Now, use another SELECT with a JOIN to show the names of each pair of friends, based on the data in the friends table. */

CREATE TABLE persons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fullname TEXT,
    age INTEGER);
    
INSERT INTO persons (fullname, age) VALUES ("Bobby McBobbyFace", "12");
INSERT INTO persons (fullname, age) VALUES ("Lucy BoBucie", "25");
INSERT INTO persons (fullname, age) VALUES ("Banana FoFanna", "14");
INSERT INTO persons (fullname, age) VALUES ("Shish Kabob", "20");
INSERT INTO persons (fullname, age) VALUES ("Fluffy Sparkles", "8");

CREATE table hobbies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person_id INTEGER,
    name TEXT);
    
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");

CREATE table friends (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person1_id INTEGER,
    person2_id INTEGER);

INSERT INTO friends (person1_id, person2_id)
    VALUES (1, 4);
INSERT INTO friends (person1_id, person2_id)
    VALUES (2, 3);
    
SELECT persons.fullname, hobbies.name
FROM persons
JOIN hobbies
ON persons.id = hobbies.person_id;

SELECT a.fullname, b.fullname
FROM friends
JOIN persons a
ON a.id = friends.person1_id
JOIN persons b
ON b.id = friends.person2_id;


/* In this project, you’re going to make your own table with some small set of “famous people”, then make more tables about things they do and join those to create nice human readable lists. */

/* Create table about the people and what they do here */
CREATE table musicians (id INTEGER PRIMARY KEY,
                        name TEXT);

INSERT INTO musicians VALUES (1, "Saul Hudson");
INSERT INTO musicians VALUES (2, "Izzy Stradlin");
INSERT INTO musicians VALUES (3, "Axl Rose");
INSERT INTO musicians VALUES (4, "Matt Sorum");
INSERT INTO musicians VALUES (5, "Mick Jagger");
INSERT INTO musicians VALUES (6, "Joe Perry");
INSERT INTO musicians VALUES (7, "Angus Young");
INSERT INTO musicians VALUES (8, "Brian Johnson");

CREATE table bands (id INTEGER PRIMARY KEY,
                    name TEXT);

INSERT INTO bands VALUES (1, "Guns n Roses");
INSERT INTO bands VALUES (2, "Aerosmith");
INSERT INTO bands VALUES (3, "AC/DC");

CREATE table memberships (person_id INTEGER,
                        band_id INTEGER);

INSERT INTO memberships VALUES (1, 1);
INSERT INTO memberships VALUES (2, 1);
INSERT INTO memberships VALUES (3, 1);
INSERT INTO memberships VALUES (4, 1);
INSERT INTO memberships VALUES (5, 2);
INSERT INTO memberships VALUES (6, 2);
INSERT INTO memberships VALUES (7, 3);
INSERT INTO memberships VALUES (8, 3);

SELECT musicians.name as "Musician name", bands.name as "Band name"
FROM memberships
JOIN musicians
ON memberships.person_id = musicians.id
JOIN bands
ON memberships.band_id = bands.id;
