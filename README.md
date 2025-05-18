# Lịch Âm - Vietnamese Lunar Calendar

Ứng dụng Lịch Âm Việt Nam được xây dựng bằng Flutter, giúp người dùng tra cứu ngày âm lịch và quản lý nhắc nhở theo lịch âm.

## Tính năng

-   **Xem lịch âm**:

    -   Hiển thị ngày âm lịch tương ứng
    -   Thông tin Can Chi của ngày, tháng, năm
    -   Hiển thị Tiết khí
    -   Giờ Hoàng đạo và ý nghĩa của ngày

-   **Ngày lễ**:

    -   Hiển thị các ngày lễ dương lịch và âm lịch
    -   Đánh dấu các ngày lễ trên lịch
    -   Thông tin chi tiết về ngày lễ

-   **Nhắc nhở**:
    -   Tạo nhắc nhở theo ngày âm lịch
    -   Hỗ trợ lặp lại hàng tháng hoặc hàng năm
    -   Quản lý danh sách nhắc nhở

## Công nghệ sử dụng

-   **Flutter & Dart**: Framework phát triển ứng dụng
-   **Riverpod**: Quản lý state
-   **Freezed**: Tạo model classes bất biến
-   **vnlunar**: Thư viện tính toán âm lịch Việt Nam
-   **shared_preferences**: Lưu trữ dữ liệu cục bộ

## Cài đặt

1. Cài đặt Flutter:

    ```bash
    flutter pub get
    ```

2. Chạy code generation:

    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

3. Chạy ứng dụng:
    ```bash
    flutter run
    ```

## Yêu cầu hệ thống

-   Flutter SDK: >=3.2.3 <4.0.0
-   Dart SDK: >=3.2.3 <4.0.0
-   Android NDK: 27.0.12077973

## Đóng góp

Nếu bạn muốn đóng góp vào dự án, hãy tạo pull request hoặc báo cáo lỗi trong mục Issues.

## Giấy phép

Dự án này được phân phối dưới giấy phép MIT. Xem file `LICENSE` để biết thêm chi tiết.

## Tác giả

[Tên tác giả] - [Thông tin liên hệ]

## Ghi nhận

-   [vnlunar](https://pub.dev/packages/vnlunar) - Thư viện tính toán âm lịch
-   [table_calendar](https://pub.dev/packages/table_calendar) - Widget lịch
-   [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) - State management
