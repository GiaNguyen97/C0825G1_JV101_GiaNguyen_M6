# PRODUCT BACKLOG - DỰ ÁN CODE ARENA
**Mục tiêu**: Nền tảng luyện tập và thi đấu lập trình trực tuyến đa ngôn ngữ, chấm bài bằng Docker & queue Redis.
**Team size**: 4 Members (M1, M2, M3, M4)

---

## 🚀 SPRINT 1: Nền tảng cốt lõi (Core Foundation)
*Mục tiêu: Dựng bộ khung xác thực, chuẩn bị luồng dữ liệu (DB/Queue) và các thao tác cơ bản nhất.*

### M4: Xác thực & Giao diện lập trình (Auth & IDE Workspace)
- **US 4.1**: Là Khách/Người dùng, tôi muốn Đăng ký, Đăng nhập và nhận JWT để xác thực các request API (cần hoàn thành sớm để các team khác tích hợp).
- **US 4.2**: Là Coder, tôi muốn có trình Editor trực tuyến (Monaco Editor) để gõ code, chọn Ngôn ngữ (C++, Java, Python, Node) và nhấn "Nộp Bài" (gắn kết nối đẩy submission_id vào Redis Queue).

### M1: Hệ thống chấm điểm tự động (Core Judge Engine)
- **US 1.1**: Là Hệ thống, tôi muốn có một service (Worker) lắng nghe hàng chờ (Redis Queue) để nhận các ID bài nộp (Submission ID) và chuẩn bị xử lý.
- **US 1.2**: Là Hệ thống, tôi muốn giao tiếp được với Docker Daemon (qua Java API) để tạo Container tạm thời dựa trên `docker_image` của ngôn ngữ tương ứng.

### M2: Quản lý Bài tập & Khởi tạo dữ liệu (Problem Management)
- **US 2.1**: Là Moderator, tôi muốn tạo và cập nhật chi tiết Bài tập gồm file Markdown mô tả, thiết lập Time Limit, Memory Limit và phân loại Tags.
- **US 2.2**: Là Moderator, tôi muốn nhập trực tiếp Input/Output qua giao diện Web (Manual Entry) cho các test cases đơn giản.
- **US 2.3**: Là Hệ thống, tôi muốn tự động kiểm tra tính hợp lệ của test case (đủ file, đúng UTF-8) trước khi lưu vào DB.

### M3: Nền tảng Cuộc thi (Contest Base)
- **US 3.1**: Là Moderator, tôi muốn thiết lập một Kỳ thi mới (Bắt đầu, Kết thúc) và chọn danh sách các Bài tập vào Kỳ thi.
- **US 3.2**: Là Hệ thống, tôi muốn thiết lập cấu trúc Redis ZSET để chuẩn bị tính toán điểm Penalty cho kỳ thi theo thời gian thực.

---

## ⚙️ SPRINT 2: Xử lý chấm điểm & Quản lý nâng cao
*Mục tiêu: Máy chấm có thể chạy được code, Import test case nâng cao và Xếp hạng Real-time.*

### M1: Thực thi chấm bài (Judge Execution)
- **US 1.3**: Là Hệ thống, tôi muốn mount (gắn) file mã nguồn và test case từ Local File System vào Docker Container để tiến hành chạy code.
- **US 1.4**: Là Hệ thống, tôi muốn giới hạn và giám sát chặt chẽ RAM / CPU Quota cho Docker Container để đảm bảo an toàn cho máy chủ.

### M2: Quản lý Testcase Nâng cao (Advanced Testcase)
- **US 2.4**: Là Moderator, tôi muốn upload một file ZIP chứa các file `.in` và `.out` để tự động giải nén và tạo hàng loạt Test Cases.
- **US 2.5**: Là Moderator, tôi muốn quản lý (ẩn/hiện, sửa, xoá) các Bài tập và các Test case tương ứng.

### M3: Logic tính điểm & Websocket (Leaderboard)
- **US 3.3**: Là Hệ thống, tôi muốn tính toán Điểm phạt (Penalty) dựa trên thời gian thực và số lần nộp sai theo chuẩn ACM-ICPC.
- **US 3.4**: Là Coder, tôi muốn xem Bảng xếp hạng thi đấu (Leaderboard) được tự động nhảy điểm và cập nhật từ Server qua kết nối WebSocket.

### M4: Trải nghiệm phòng code (User Experience)
- **US 4.3**: Là Coder, tôi muốn nhận kết quả trạng thái chấm bài từ Server lập tức qua WebSocket (hoặc Polling) mà không cần tải lại trang.
- **US 4.4**: Là Coder, tôi muốn thử chạy code (Run Code) với các Sample Test Case lấy từ DB để hiển thị trực tiếp trên Workspace.

---

## 🏆 SPRINT 3: Hoàn thiện tính năng & Giám sát hệ thống
*Mục tiêu: Đưa ra thông báo kết quả cuối cùng đúng sai cho người nộp, Giám sát và Thống kê tài khoản.*

### M1: Đối soát & Lưu trữ kết quả (Judge Result)
- **US 1.5**: Là Hệ thống, tôi muốn so sánh Output của người dùng sinh ra với Output mẫu (Standard Output) để cập nhật trạng thái kết quả cuối cùng (AC, WA, TLE, MLE, RE, CE).
- **US 1.6**: Là Hệ thống, tôi muốn lưu kết quả chi tiết từng Test Case của một lượt nộp bài xuống database MySQL để hiển thị cho người dùng.

### M2: Theo dõi bài nộp (Submission Management)
- **US 2.6**: Là Moderator, tôi muốn xem lại danh sách tất cả các lượt nộp bài của toàn hệ thống và kiểm tra xem chi tiết mã nguồn của từng người dùng.

### M3: Tham gia & Monitor phòng thi (Contest Live)
- **US 3.5**: Là Coder, tôi muốn bấm đăng ký tham gia một kỳ thi và đồng hồ đếm ngược bắt đầu tính giờ làm bài.
- **US 3.6**: Là Moderator, tôi muốn giám sát tỷ lệ AC (Acceptances Rate) và số người tham gia trực tiếp trong lúc kỳ thi đang diễn ra (Contest Monitor).

### M4: Admin & Thống kê cá nhân (Admin & Stats)
- **US 4.5**: Là Coder, tôi muốn xem thông tin Cá nhân (Profile) bao gồm biểu đồ Global Rating và lịch sử tham gia kỳ thi.
- **US 4.6**: Là Admin, tôi muốn cấu hình và quản lý các Ngôn ngữ lập trình (tên Docker image) và quản lý người dùng (Khoá tài khoản vi phạm, Cấp quyền).
