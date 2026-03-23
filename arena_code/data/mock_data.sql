USE code_arena;

-- ==========================================
-- 1. CHÈN NGƯỜI DÙNG (Mật khẩu giả định đã hash: 'password123')
-- ==========================================
INSERT INTO users (id, username, email, password_hash, role, global_rating) VALUES
(1, 'admin', 'admin@codearena.com', '$2a$12$R9h/lIPzHZ5.S7W1X.yY.uH7.6J8vB/A.nK1V/O.T.X/G', 'admin', 2000),
(2, 'giangvien_tung', 'tung.moderator@hust.edu.vn', '$2a$12$R9h/lIPzHZ5.S7W1X.yY.uH7.6J8vB/A.nK1V/O.T.X/G', 'moderator', 1800),
(3, 'nguyenvana', 'vana@gmail.com', '$2a$12$R9h/lIPzHZ5.S7W1X.yY.uH7.6J8vB/A.nK1V/O.T.X/G', 'user', 1550),
(4, 'tranvanb', 'vanb@gmail.com', '$2a$12$R9h/lIPzHZ5.S7W1X.yY.uH7.6J8vB/A.nK1V/O.T.X/G', 'user', 1420),
(5, 'lethic', 'thic@gmail.com', '$2a$12$R9h/lIPzHZ5.S7W1X.yY.uH7.6J8vB/A.nK1V/O.T.X/G', 'user', 1600);

INSERT INTO profiles (user_id, avatar_url, bio, github_link) VALUES
(1, 'https://i.pravatar.cc/150?u=1', 'Hệ thống quản trị viên.', 'https://github.com/admin'),
(2, 'https://i.pravatar.cc/150?u=2', 'Giảng viên khoa CNTT, yêu thích thuật toán.', 'https://github.com/tungmod'),
(3, 'https://i.pravatar.cc/150?u=3', 'Sinh viên năm 2, đang học cấu trúc dữ liệu.', 'https://github.com/vana');

-- ==========================================
-- 2. CHÈN NGÔN NGỮ
-- ==========================================
-- Đã có ở script trước, nhưng chèn lại để đảm bảo đồng bộ ID
INSERT INTO languages (id, name, compiler_option, is_active) VALUES 
(1, 'C++ 20', 'g++ -O3 -std=c++20', TRUE),
(2, 'Python 3', 'python3 -u', TRUE),
(3, 'Java 17', 'javac Solution.java && java Solution', TRUE);

-- ==========================================
-- 3. CHÈN BÀI TẬP (PROBLEMS)
-- ==========================================
INSERT INTO problems (id, title, slug, description, difficulty, time_limit, memory_limit, created_by) VALUES
(1, 'Tổng hai số', 'sum-of-two-numbers', '# Đề bài\nCho hai số nguyên A và B. Hãy tính tổng của chúng.\n\n### Input\nMột dòng duy nhất chứa hai số nguyên A, B (-10^9 <= A, B <= 10^9).\n\n### Output\nTổng của A và B.', 'easy', 1000, 256, 2),
(2, 'Số Fibonacci thứ N', 'fibonacci-n', '# Đề bài\nTìm số Fibonacci thứ N. Với F(0)=0, F(1)=1.\n\n### Input\nSố nguyên N (0 <= N <= 45).\n\n### Output\nGiá trị F(N).', 'medium', 500, 128, 2),
(3, 'Tìm đường đi ngắn nhất', 'shortest-path', '# Đề bài\nCho đồ thị có trọng số, tìm đường đi ngắn nhất từ đỉnh S tới T.', 'hard', 2000, 512, 1);

-- ==========================================
-- 4. CHÈN TEST CASES
-- ==========================================
INSERT INTO test_cases (problem_id, input, expected_output, is_sample, score_weight) VALUES
-- Bài 1
(1, '5 10', '15', TRUE, 10),
(1, '-5 5', '0', FALSE, 10),
(1, '1000000000 1000000000', '2000000000', FALSE, 10),
-- Bài 2
(2, '5', '5', TRUE, 20),
(2, '10', '55', FALSE, 20),
(2, '45', '1134903170', FALSE, 20);

-- ==========================================
-- 5. NHÃN BÀI TẬP (TAGS)
-- ==========================================
INSERT INTO tags (name) VALUES ('Dynamic Programming'), ('Graph'), ('Math'), ('String');
INSERT INTO problem_tags (problem_id, tag_id) VALUES
(1, 3), -- Bài 1 - Math
(2, 1), -- Bài 2 - DP
(2, 3), -- Bài 2 - Math
(3, 2); -- Bài 3 - Graph

-- ==========================================
-- 6. CUỘC THI (CONTESTS)
-- ==========================================
INSERT INTO contests (id, title, description, start_time, end_time, status) VALUES
(1, 'Code Arena Weekly #1', 'Cuộc thi hàng tuần dành cho người mới.', NOW() - INTERVAL 1 DAY, NOW() + INTERVAL 2 HOUR, 'active'),
(2, 'Algorithm Masters 2024', 'Cuộc thi thuật toán đỉnh cao.', NOW() + INTERVAL 5 DAY, NOW() + INTERVAL 6 DAY, 'upcoming');

INSERT INTO contest_problems (contest_id, problem_id, order_index) VALUES
(1, 1, 1),
(1, 2, 2);

INSERT INTO contest_participants (contest_id, user_id) VALUES
(1, 3),
(1, 4),
(1, 5);

-- ==========================================
-- 7. BÀI NỘP (SUBMISSIONS)
-- ==========================================
INSERT INTO submissions (id, user_id, problem_id, contest_id, language_id, source_code, status, execution_time, memory_used, score) VALUES
(1, 3, 1, 1, 1, '#include <iostream>\nusing namespace std;\nint main() { long long a, b; cin >> a >> b; cout << a + b; return 0; }', 'AC', 15, 1024, 30),
(2, 4, 1, 1, 2, 'a, b = map(int, input().split())\nprint(a + b)', 'AC', 45, 2048, 30),
(3, 5, 2, 1, 1, 'int main() { return 0; }', 'WA', 10, 512, 0),
(4, 3, 2, 1, 2, 'def fib(n): return n if n <= 1 else fib(n-1) + fib(n-2)\nprint(fib(int(input())))', 'TLE', 501, 4096, 20);

-- ==========================================
-- 8. KẾT QUẢ CHI TIẾT TỪNG TEST CASE
-- ==========================================
INSERT INTO submission_test_results (submission_id, test_case_id, status, execution_time, memory_used, user_output) VALUES
-- Bài nộp số 1 (AC sạch)
(1, 1, 'AC', 5, 1024, '15'),
(1, 2, 'AC', 4, 1024, '0'),
(1, 3, 'AC', 6, 1024, '2000000000'),
-- Bài nộp số 4 (TLE ở test case cuối)
(4, 4, 'AC', 10, 2048, '5'),
(4, 5, 'AC', 50, 2048, '55'),
(4, 6, 'TLE', 501, 4096, NULL);

-- ==========================================
-- 9. BÀI VIẾT THẢO LUẬN (POSTS)
-- ==========================================
INSERT INTO posts (user_id, title, content) VALUES
(2, 'Chào mừng đến với Code Arena', 'Hãy cùng nhau luyện tập thuật toán mỗi ngày nhé các bạn!'),
(3, 'Làm sao để tối ưu bài Fibonacci?', 'Mình nộp bằng Python bài Fib 45 bị TLE hoài, ai giúp với?');