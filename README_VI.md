# NewBieProject

Một dự án C++ đơn giản thể hiện các phép toán cơ bản và cấu hình CMake dành cho người mới bắt đầu.

[Quay lại lựa chọn ngôn ngữ](README.md)

## Cấu trúc dự án

```
[root]/
  ├── CMakeLists.txt    # Tệp cấu hình CMake
  ├── includes/         # Thư mục chứa các tệp header
  │   ├── common.h      # Các include và namespace phổ biến
  │   └── math_utils.h  # Khai báo các hàm tiện ích toán học
  ├── inputs/           # Thư mục chứa các tệp input cho kiểm thử
  │   └── input_*.txt   # Các tệp dữ liệu đầu vào
  ├── outputs/          # Thư mục chứa kết quả đầu ra của chương trình
  │   └── output_*.txt  # Các tệp kết quả
  ├── solutions/        # Thư mục chứa đáp án mẫu
  │   └── solution_*.txt # Các tệp đáp án
  ├── README.md         # Tệp lựa chọn ngôn ngữ
  ├── README_EN.md      # Tài liệu tiếng Anh
  ├── README_VI.md      # Tệp này (tài liệu tiếng Việt)
  ├── run.sh            # Script xây dựng và chạy
  └── src/              # Thư mục chứa mã nguồn
      ├── main.cpp      # Điểm vào chương trình chính
      └── math_utils.cpp # Triển khai các hàm tiện ích toán học
```

## Tính năng

- Các hàm cộng và nhân đơn giản
- Hai tùy chọn xây dựng:
  - Xây dựng nhanh với g++
  - Xây dựng chuyên nghiệp với CMake
- Hệ thống kiểm thử tự động với nhiều bộ test

## Xây dựng và chạy

Dự án bao gồm một script shell tiện lợi để xây dựng và chạy:

```bash
./run.sh [option]
```

Các tùy chọn:

- `g++`: Xây dựng nhanh sử dụng g++
- `cmake`: Xây dựng chuyên nghiệp với CMake
- `test`: Chạy các bộ test (tự động xây dựng nếu cần)
- `help`: Hiển thị thông báo trợ giúp

### Chế độ kiểm thử

Để chạy kiểm thử:

```bash
./run.sh test
```

Script sẽ yêu cầu chọn phương thức xây dựng (mặc định là g++) và sau đó thực hiện:
1. Chạy chương trình với mỗi tệp đầu vào trong thư mục `inputs/`
2. Lưu kết quả vào thư mục `outputs/`
3. So sánh kết quả với đáp án trong `solutions/`
4. Báo cáo tóm tắt kết quả kiểm thử

## Yêu cầu

- Trình biên dịch C++ (khuyên dùng g++)
- CMake (phiên bản 3.10 trở lên) cho xây dựng chuyên nghiệp

## Chi tiết triển khai

Dự án triển khai hai hàm toán học cơ bản:

- `add(int a, int b)`: Trả về tổng của hai số nguyên
- `multiply(int a, int b)`: Trả về tích của hai số nguyên

Chương trình đọc dữ liệu đầu vào từ stdin, cho phép xử lý nhiều bộ test case.

## Giấy phép

Dự án này có sẵn cho mục đích giáo dục. 