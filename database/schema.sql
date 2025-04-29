-- Transactions (Header)
CREATE TABLE IF NOT EXISTS transactions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    cash REAL DEFAULT 0,
    card REAL DEFAULT 0,
    upi REAL DEFAULT 0,
    comments TEXT,
    total_amount REAL DEFAULT 0
);

-- Transaction Items (Line Items)
CREATE TABLE IF NOT EXISTS transaction_items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    transaction_id INTEGER NOT NULL,
    type TEXT CHECK(type IN ('new', 'old')) NOT NULL,
    item_code TEXT,
    item_name TEXT,
    item_type TEXT CHECK(item_type IN ('gold', 'silver', 'other')),
    weight REAL,
    amount REAL,
    mark_bill INTEGER DEFAULT 1, -- 1 = Yes, 0 = No
    FOREIGN KEY(transaction_id) REFERENCES transactions(id) ON DELETE CASCADE
);
