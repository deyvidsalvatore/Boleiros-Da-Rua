\c db_users;

-- Inserindo Roles
INSERT INTO roles (name, description) VALUES
                                          ('ADMIN', 'Administrador total do sistema'),
                                          ('MODERATOR', 'Moderador de partidas e clubes'),
                                          ('PLAYER', 'Usuário jogador');

-- Inserindo Usuários (24 usuários)
-- Admin (1), Moderador (1), Jogadores (22)
INSERT INTO users (id, full_name, email, password_hash, education_level, active) VALUES
                                                                                     ('00000000-0000-0000-0000-000000000001', 'Sistema Admin', 'admin@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Superior', true),
                                                                                     ('00000000-0000-0000-0000-000000000002', 'Ricardo Moderador', 'ricardo.mod@gmail.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Superior', true);

-- Jogadores (Loop de IDs sequenciais para facilitar o mapeamento no db_soccer)
INSERT INTO users (id, full_name, email, password_hash, education_level) VALUES
                                                                             ('00000000-0000-0000-0000-000000000101', 'Gabriel Silva', 'player1@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Médio'),
                                                                             ('00000000-0000-0000-0000-000000000102', 'Lucas Santos', 'player2@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Médio'),
                                                                             ('00000000-0000-0000-0000-000000000103', 'Matheus Oliveira', 'player3@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Superior'),
                                                                             ('00000000-0000-0000-0000-000000000104', 'Felipe Costa', 'player4@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Superior'),
                                                                             ('00000000-0000-0000-0000-000000000105', 'João Pereira', 'player5@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Médio'),
                                                                             ('00000000-0000-0000-0000-000000000106', 'Rafael Souza', 'player6@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Superior'),
                                                                             ('00000000-0000-0000-0000-000000000107', 'Bruno Alves', 'player7@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Médio'),
                                                                             ('00000000-0000-0000-0000-000000000108', 'Thiago Lima', 'player8@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Médio'),
                                                                             ('00000000-0000-0000-0000-000000000109', 'André Ribeiro', 'player9@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Superior'),
                                                                             ('00000000-0000-0000-0000-000000000110', 'Vitor Gomes', 'player10@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Médio'),
                                                                             ('00000000-0000-0000-0000-000000000111', 'Daniel Rocha', 'player11@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Médio'),
                                                                             ('00000000-0000-0000-0000-000000000112', 'Igor Martins', 'player12@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Superior'),
                                                                             ('00000000-0000-0000-0000-000000000113', 'Gustavo Henrique', 'player13@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Médio'),
                                                                             ('00000000-0000-0000-0000-000000000114', 'Rodrigo Silva', 'player14@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Superior'),
                                                                             ('00000000-0000-0000-0000-000000000115', 'Eduardo Pires', 'player15@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Médio'),
                                                                             ('00000000-0000-0000-0000-000000000116', 'Marcelo Vieira', 'player16@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Médio'),
                                                                             ('00000000-0000-0000-0000-000000000117', 'Alexandre Borges', 'player17@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Superior'),
                                                                             ('00000000-0000-0000-0000-000000000118', 'Hugo Nascimento', 'player18@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Médio'),
                                                                             ('00000000-0000-0000-0000-000000000119', 'Leonardo Ferraz', 'player19@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Médio'),
                                                                             ('00000000-0000-0000-0000-000000000120', 'Samuel Mendes', 'player20@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Superior'),
                                                                             ('00000000-0000-0000-0000-000000000121', 'Caio Duarte', 'player21@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Médio'),
                                                                             ('00000000-0000-0000-0000-000000000122', 'Vinícius Junior', 'player22@soccer.com', '$2a$10$Za128FedtZVTMcLwMxeozOhJV16Nw1j4C4WWAbl/U5EM9xsxHmcw6', 'Superior');

-- Associando Roles
INSERT INTO user_roles (user_id, role_id) VALUES
                                              ('00000000-0000-0000-0000-000000000001', 1), -- Admin
                                              ('00000000-0000-0000-0000-000000000002', 2); -- Moderador

-- Associando Jogadores (loop simples)
INSERT INTO user_roles (user_id, role_id)
SELECT id, 3
FROM users
WHERE id::text LIKE '%-0000000001%';

\c db_soccer;

-- 1. Locais e Endereços (Recife)
INSERT INTO locations (id, name, latitude, longitude) VALUES
                                                          ('11111111-1111-1111-1111-111111111111', 'Arena Pernambuco', -8.0401, -34.9123),
                                                          ('22222222-2222-2222-2222-222222222222', 'Campo do Derby', -8.0556, -34.8931);

INSERT INTO addresses (location_id, street, neighborhood, city, postal_code) VALUES
                                                                                 ('11111111-1111-1111-1111-111111111111', 'Av. Deus é Fiel', 'Penedo', 'São Lourenço da Mata', '54730-000'),
                                                                                 ('22222222-2222-2222-2222-222222222222', 'Praça do Derby', 'Derby', 'Recife', '52010-140');

-- 2. Clubes (Dono é o Admin do outro DB)
INSERT INTO clubs (id, name, description, owner_id) VALUES
                                                        ('33333333-3333-3333-3333-333333333333', 'Recife Warriors', 'Clube da zona norte', '00000000-0000-0000-0000-000000000001'),
                                                        ('44444444-4444-4444-4444-444444444444', 'Olinda Sharks', 'Clube histórico', '00000000-0000-0000-0000-000000000001');

-- 3. Membros do Clube (Distribuindo os 22 jogadores)
-- Time A (11 jogadores)
INSERT INTO club_members (club_id, user_id, member_role) VALUES
                                                             ('33333333-3333-3333-3333-333333333333', '00000000-0000-0000-0000-000000000101', 'ADMIN'),
                                                             ('33333333-3333-3333-3333-333333333333', '00000000-0000-0000-0000-000000000102', 'MEMBER'),
                                                             ('33333333-3333-3333-3333-333333333333', '00000000-0000-0000-0000-000000000103', 'MEMBER'),
                                                             ('33333333-3333-3333-3333-333333333333', '00000000-0000-0000-0000-000000000104', 'MEMBER'),
                                                             ('33333333-3333-3333-3333-333333333333', '00000000-0000-0000-0000-000000000105', 'MEMBER'),
                                                             ('33333333-3333-3333-3333-333333333333', '00000000-0000-0000-0000-000000000106', 'MEMBER'),
                                                             ('33333333-3333-3333-3333-333333333333', '00000000-0000-0000-0000-000000000107', 'MEMBER'),
                                                             ('33333333-3333-3333-3333-333333333333', '00000000-0000-0000-0000-000000000108', 'MEMBER'),
                                                             ('33333333-3333-3333-3333-333333333333', '00000000-0000-0000-0000-000000000109', 'MEMBER'),
                                                             ('33333333-3333-3333-3333-333333333333', '00000000-0000-0000-0000-000000000110', 'MEMBER'),
                                                             ('33333333-3333-3333-3333-333333333333', '00000000-0000-0000-0000-000000000111', 'MEMBER');

-- Time B (11 jogadores)
INSERT INTO club_members (club_id, user_id, member_role) VALUES
                                                             ('44444444-4444-4444-4444-444444444444', '00000000-0000-0000-0000-000000000112', 'ADMIN'),
                                                             ('44444444-4444-4444-4444-444444444444', '00000000-0000-0000-0000-000000000113', 'MEMBER'),
                                                             ('44444444-4444-4444-4444-444444444444', '00000000-0000-0000-0000-000000000114', 'MEMBER'),
                                                             ('44444444-4444-4444-4444-444444444444', '00000000-0000-0000-0000-000000000115', 'MEMBER'),
                                                             ('44444444-4444-4444-4444-444444444444', '00000000-0000-0000-0000-000000000116', 'MEMBER'),
                                                             ('44444444-4444-4444-4444-444444444444', '00000000-0000-0000-0000-000000000117', 'MEMBER'),
                                                             ('44444444-4444-4444-4444-444444444444', '00000000-0000-0000-0000-000000000118', 'MEMBER'),
                                                             ('44444444-4444-4444-4444-444444444444', '00000000-0000-0000-0000-000000000119', 'MEMBER'),
                                                             ('44444444-4444-4444-4444-444444444444', '00000000-0000-0000-0000-000000000120', 'MEMBER'),
                                                             ('44444444-4444-4444-4444-444444444444', '00000000-0000-0000-0000-000000000121', 'MEMBER'),
                                                             ('44444444-4444-4444-4444-444444444444', '00000000-0000-0000-0000-000000000122', 'MEMBER');

-- 4. Criando uma Partida (Moderada pelo usuário 2)
INSERT INTO matches (id, moderator_id, location_id, club_home_id, club_away_id, scheduled_time, status) VALUES
    ('55555555-5555-5555-5555-555555555555', '00000000-0000-0000-0000-000000000002', '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333333', '44444444-4444-4444-4444-444444444444', NOW() + INTERVAL '1 day', 'SCHEDULED');

\c db_soccer;

-- 5. Populando MATCH_ROSTER (Escalação da Partida)
-- Colocando os 11 jogadores do Recife Warriors no lado HOME
INSERT INTO match_roster (match_id, player_id, team_side, player_type, check_in_time)
SELECT '55555555-5555-5555-5555-555555555555', user_id, 'HOME', 'CLUB_MEMBER', NOW()
FROM club_members
WHERE club_id = '33333333-3333-3333-3333-333333333333';

-- Colocando os 11 jogadores do Olinda Sharks no lado AWAY
INSERT INTO match_roster (match_id, player_id, team_side, player_type, check_in_time)
SELECT '55555555-5555-5555-5555-555555555555', user_id, 'AWAY', 'CLUB_MEMBER', NOW()
FROM club_members
WHERE club_id = '44444444-4444-4444-4444-444444444444';


-- 6. Populando MATCH_EVENTS (Ações durante o jogo)
-- Simulando alguns eventos para a partida criada (Gols, Cartões)
INSERT INTO match_events (match_id, player_id, event_type, minute_offset, video_evidence_url) VALUES
                                                                                                  ('55555555-5555-5555-5555-555555555555', '00000000-0000-0000-0000-000000000101', 'GOAL', 12, 'http://video.com/gol1'),
                                                                                                  ('55555555-5555-5555-5555-555555555555', '00000000-0000-0000-0000-000000000112', 'YELLOW_CARD', 30, NULL),
                                                                                                  ('55555555-5555-5555-5555-555555555555', '00000000-0000-0000-0000-000000000105', 'GOAL', 44, 'http://video.com/gol2'),
                                                                                                  ('55555555-5555-5555-5555-555555555555', '00000000-0000-0000-0000-000000000115', 'RED_CARD', 85, 'http://video.com/falta_grave');

-- Atualizando o placar da partida com base nos eventos acima
UPDATE matches SET score_home = 2, score_away = 0, status = 'FINISHED',
                   actual_start_time = NOW(), actual_end_time = NOW() + INTERVAL '90 minutes'
WHERE id = '55555555-5555-5555-5555-555555555555';


-- 7. Populando REPORTS (Sistema de Denúncias)
-- Um jogador do time perdedor denuncia o moderador
INSERT INTO reports (match_id, reporter_id, reported_moderator_id, reason, status) VALUES
    ('55555555-5555-5555-5555-555555555555',
     '00000000-0000-0000-0000-000000000115',
     '00000000-0000-0000-0000-000000000002',
     'O moderador não marcou um pênalti claro aos 80 minutos e me expulsou injustamente.',
     'PENDING');