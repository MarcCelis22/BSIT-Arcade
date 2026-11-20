-- Sample Seed Data
-- Passwords belong to Supabase Auth (auth.users), not public.users.
-- Do not add password or password_hash columns to public.users.
INSERT INTO users (user_id, user_name, email, role) VALUES 
('usr001', 'Marc Celis', 'marc.celis@bsit.edu', 'Developer'),
('usr002', 'Charles Martillano', 'charles.martillano@bsit.edu', 'Developer'),
('usr003', 'Paul Dela Vega', 'paul.dela.vega@bsit.edu', 'Student'),
('usr004', 'Larry Vivero', 'larry.vivero@bsit.edu', 'Student'),
('usr005', 'Prof. Joni Capucao', 'joni.capucao@bsit.edu', 'Faculty');

INSERT INTO categories (category_id, category_name, description) VALUES 
('cat001', 'Multiplayer (LAN)', 'Games designed for local network connectivity over Wi-Fi or LAN.'),
('cat002', 'Action / Arcade', 'Fast-paced standalone games designed for casual single-player playthroughs.'),
('cat003', 'RPG / Adventure', 'Narrative-driven, explorer-focused standalone offline titles.');

INSERT INTO games (game_id, developer_id, category_id, title) VALUES
('gam001', 'usr001', 'cat001', 'Lab Shooter: Local Wi-Fi Edition'),
('gam002', 'usr001', 'cat002', 'Arcade Central Mania'),
('gam003', 'usr002', 'cat001', 'Campus Clash LAN'),
('gam004', 'usr002', 'cat003', 'Chronicles of Bicolia Offline RPG'),
('gam005', 'usr001', 'cat002', 'IT Lab Block Breaker');

INSERT INTO game_versions (version_id, game_id, version_number, download_url) VALUES
('ver001', 'gam001', 'v1.0.0-lan', 'https://downloads.arcade.bsit/builds/lab-shooter-v1.0.zip'),
('ver002', 'gam001', 'v1.1.0-lan', 'https://downloads.arcade.bsit/builds/lab-shooter-v1.1.zip'),
('ver003', 'gam002', 'v1.0.0-offline', 'https://downloads.arcade.bsit/builds/central-mania-v1.0.exe'),
('ver004', 'gam003', 'v2.0.1-wifi', 'https://downloads.arcade.bsit/builds/campus-clash-v2.0.1.apk'),
('ver005', 'gam004', 'v0.9.5-beta', 'https://downloads.arcade.bsit/builds/bicolia-rpg-v0.9.5.zip'),
('ver006', 'gam005', 'v1.0.0-desktop', 'https://downloads.arcade.bsit/builds/block-breaker-v1.0.zip');

INSERT INTO reviews (review_id, game_id, user_id, rating, comment) VALUES
('rev001', 'gam001', 'usr003', 4.75, 'Zero lag across the IT Lab LAN switch.'),
('rev002', 'gam001', 'usr005', 4.50, 'Solid multiplayer implementation and lobby discovery.'),
('rev003', 'gam002', 'usr003', 5.00, 'Addictive arcade loop and smooth offline play.'),
('rev004', 'gam003', 'usr005', 4.25, 'Great Android Wi-Fi multiplayer test.'),
('rev005', 'gam004', 'usr004', 4.75, 'The campus locations make the story memorable.');

INSERT INTO game_sessions (session_id, version_id, user_id, score, play_time_minutes) VALUES
('ses001', 'ver001', 'usr003', 2500, 45.50),
('ses002', 'ver002', 'usr003', 3450, 62.00),
('ses003', 'ver003', 'usr004', 980, 18.50),
('ses004', 'ver004', 'usr001', 4100, 55.00),
('ses005', 'ver005', 'usr005', 1500, 30.00),
('ses006', 'ver006', 'usr004', 2750, 36.25);

-- Enable row-level security before adding the policies below.
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.games ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.game_versions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.reviews ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.game_sessions ENABLE ROW LEVEL SECURITY;

-- Public Read & Insert Policies for BSIT Arcade Web Client
CREATE POLICY "Public Read Users" ON users FOR SELECT USING (true);
CREATE POLICY "Authenticated users can create own profile" ON users
    FOR INSERT TO authenticated
    WITH CHECK (auth.uid()::text = user_id);
CREATE POLICY "Public Read Categories" ON categories FOR SELECT USING (true);
CREATE POLICY "Public Read Games" ON games FOR SELECT USING (true);
CREATE POLICY "Public Insert Games" ON games FOR INSERT WITH CHECK (true);
CREATE POLICY "Public Read Versions" ON game_versions FOR SELECT USING (true);
CREATE POLICY "Public Insert Versions" ON game_versions FOR INSERT WITH CHECK (true);
CREATE POLICY "Public Read Reviews" ON reviews FOR SELECT USING (true);
CREATE POLICY "Public Insert Reviews" ON reviews FOR INSERT WITH CHECK (true);
CREATE POLICY "Public Read Sessions" ON game_sessions FOR SELECT USING (true);
CREATE POLICY "Public Insert Sessions" ON game_sessions FOR INSERT WITH CHECK (true);

-- Task 4 Analytical Query
SELECT 
    g.title AS game_title,
    gv.version_number,
    COUNT(gs.session_id) AS total_gameplay_sessions,
    SUM(gs.play_time_minutes) AS aggregate_play_minutes
FROM games g
JOIN game_versions gv ON g.game_id = gv.game_id
JOIN game_sessions gs ON gv.version_id = gs.version_id
GROUP BY g.game_id, g.title, gv.version_id, gv.version_number
ORDER BY aggregate_play_minutes DESC;
