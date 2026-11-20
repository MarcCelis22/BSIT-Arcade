# Project Brief: BSIT Arcade

## 1. The problem
BSIT students need a simple way to share and find games created for campus projects especially game-based capstone. Games are currently scattered across class chats and local drives, making releases and feedback difficult to discover.

## 2. Users and what they need to do

User role | What they need to do in the app
----------|-----------------------------------------------------
Guest     | Browse games, open details, and see game information
Student   | Browse games, play a game, and submit one review
Developer | Publish games, add versions, and view game sessions
Faculty   | Review submissions and manage categories

## 3. The database behind it
Database: Supabase/PostgreSQL BSIT Arcade; 6 tables.

- `users` stores student, developer, and faculty profiles.
- `categories` stores the game categories and descriptions.
- `games` stores published game titles and their developer/category links.
- `game_versions` stores downloadable builds for each game.
- `reviews` stores one rating and comment per user per game.
- `game_sessions` stores scores and play-time records for game versions.

## 4. Must-have features

- Add a game to the `games` table.
- Search games from the `games` table.
- Update game details in the `games` table.
- Publish versions to the `game_versions` table.
- Submit a review to the `reviews` table.
- Record gameplay in the `game_sessions` table.

## 5. Nice-to-have features

- Filter games by category.
- Compare play activity across versions.
- Download version builds.

## 6. Similar apps I looked at

- itch.io: I will borrow the game-card layout and clear publish/download actions.
- Steam: I will borrow category filters and user rating summaries.
