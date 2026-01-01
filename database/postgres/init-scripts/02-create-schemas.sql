\c db_users;

CREATE TABLE roles (
                       id SERIAL PRIMARY KEY,
                       name VARCHAR(50) UNIQUE NOT NULL,
                       description TEXT
);

CREATE TABLE users (
                       id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                       full_name VARCHAR(150) NOT NULL,
                       email VARCHAR(255) UNIQUE NOT NULL,
                       password_hash VARCHAR(255) NOT NULL,
                       education_level VARCHAR(50) NOT NULL,
                       profile_picture_url VARCHAR(255),
                       active BOOLEAN DEFAULT TRUE,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_roles (
                            user_id UUID REFERENCES users(id),
                            role_id INT REFERENCES roles(id),
                            assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            PRIMARY KEY (user_id, role_id)
);

\c db_soccer;

CREATE TABLE clubs (
                       id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                       name VARCHAR(100) UNIQUE NOT NULL,
                       description TEXT,
                       logo_url VARCHAR(255),
                       owner_id UUID NOT NULL,
                       total_points INT DEFAULT 0,
                       active BOOLEAN DEFAULT TRUE,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE club_members (
                              club_id UUID REFERENCES clubs(id),
                              user_id UUID NOT NULL,
                              joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              member_role VARCHAR(20) DEFAULT 'MEMBER' CHECK (member_role IN ('MEMBER', 'ADMIN')),
                              PRIMARY KEY (club_id, user_id)
);

CREATE TABLE locations (
                           id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                           name VARCHAR(100) NOT NULL,
                           latitude DECIMAL(9,6) NOT NULL,
                           longitude DECIMAL(9,6) NOT NULL,
                           is_official BOOLEAN DEFAULT TRUE,
                           active BOOLEAN DEFAULT TRUE
);

CREATE TABLE addresses (
                           id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                           location_id UUID REFERENCES locations(id) ON DELETE CASCADE,
                           street VARCHAR(255),
                           neighborhood VARCHAR(100),
                           city VARCHAR(100) DEFAULT 'Recife',
                           postal_code VARCHAR(20)
);

CREATE TABLE matches (
                         id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                         moderator_id UUID NOT NULL,
                         location_id UUID REFERENCES locations(id),
                         club_home_id UUID REFERENCES clubs(id),
                         club_away_id UUID REFERENCES clubs(id),
                         scheduled_time TIMESTAMP NOT NULL,
                         actual_start_time TIMESTAMP,
                         actual_end_time TIMESTAMP,
                         status VARCHAR(20) CHECK (status IN ('SCHEDULED', 'LIVE', 'FINISHED', 'CANCELED')),
                         score_home INT DEFAULT 0,
                         score_away INT DEFAULT 0,
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE match_roster (
                              id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                              match_id UUID REFERENCES matches(id),
                              player_id UUID NOT NULL,
                              team_side VARCHAR(10) CHECK (team_side IN ('HOME', 'AWAY')),
                              player_type VARCHAR(20) CHECK (player_type IN ('CLUB_MEMBER', 'TEMPORARY', 'GUEST')),
                              check_in_time TIMESTAMP,
                              performance_rating DECIMAL(3,2),
                              UNIQUE(match_id, player_id)
);

CREATE TABLE match_events (
                              id BIGSERIAL PRIMARY KEY,
                              match_id UUID REFERENCES matches(id),
                              player_id UUID NOT NULL,
                              event_type VARCHAR(30),
                              minute_offset INT,
                              video_evidence_url VARCHAR(255),
                              created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE reports (
                         id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                         match_id UUID REFERENCES matches(id),
                         reporter_id UUID NOT NULL,
                         reported_moderator_id UUID NOT NULL,
                         reason TEXT NOT NULL,
                         evidence_url VARCHAR(255),
                         status VARCHAR(20) DEFAULT 'PENDING' CHECK (status IN ('PENDING', 'APPROVED', 'REJECTED')),
                         judgment_notes TEXT,
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
