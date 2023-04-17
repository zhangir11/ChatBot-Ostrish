CREATE TABLE IF NOT EXISTS "userSession"(
    "user_id" BIGSERIAL PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "token" TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS "questions"(
    "question_id" BIGSERIAL PRIMARY KEY,
    "text" TEXT NOT NULL,
    "answer" TEXT NOT NULL,
    "queue" smallint NOT NULL
);

CREATE TABLE IF NOT EXISTS "words"(
    "word_id" BIGSERIAL PRIMARY KEY,
    "text" TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS "wordquestionbind"(
    "word_id" BIGSERIAL NOT NULL REFERENCES "words" ("word_id") ON DELETE CASCADE,
    "question_id" BIGSERIAL NOT NULL REFERENCES "questions" ("question_id") ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "word2wordbind"(
    "wordR_id" BIGSERIAL NOT NULL REFERENCES "words" ("word_id") ON DELETE CASCADE,
    "wordL_id" BIGSERIAL NOT NULL REFERENCES "words" ("word_id") ON DELETE CASCADE
);