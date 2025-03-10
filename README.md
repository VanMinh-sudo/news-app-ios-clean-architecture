# news-app-ios-clean-architecture

this project is developing based on VIP pattern:
https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template

Các thành phần trong VIP:
1. View (UIViewController):
  Chúng ta có thể xem View (bao gồm cả UIViewController) là nơi mỗi chu kỳ VIP bắt đầu và kết thúc (nó truyền thông tin và sự kiện đến Interactor và nhận phản hồi từ Presenter).
- UIViewController quản lý màn hình (scene) và giữ một tham chiếu mạnh đến View.
- Mỗi UIViewController giữ các tham chiếu mạnh đến Interactor và Router.
- Các sự kiện xảy ra trong View được chuyển đến Interactor.
- View nhận dữ liệu từ Presenter vì UIViewController phải tuân thủ giao thức (protocol) được sử dụng bởi Presenter để gửi thông tin.
2. Interactor:
  Interactor chịu trách nhiệm quản lý các yêu cầu từ View, lấy dữ liệu cần thiết (từ Cơ sở dữ liệu hoặc Mạng), và chuyển nó cho Presenter:
- Interactor chứa logic nghiệp vụ của mỗi màn hình (scene).
- Tùy thuộc vào các yêu cầu từ View, Interactor kết nối với một hoặc nhiều Worker/Service (những thứ, như chúng ta sẽ thấy, chịu trách nhiệm lấy dữ liệu).
- Interactor giữ một tham chiếu mạnh đến Presenter.
- Interactor phải tuân thủ giao thức (protocol) mà View sử dụng để gửi sự kiện.
3. Presenter:
  Chức năng của Presenter là lấy thông tin nó nhận được từ Interactor và chuyển đổi nó thành thông tin có thể được biểu diễn bởi View (tức là, chúng ta chuyển đổi thông tin thành ViewModel):
- Presenter chứa logic hiển thị lên màn hình.
- Nó có một tham chiếu yếu đến View (nơi đóng vai trò là đầu ra của Presenter).
- Presenter chuyển đổi kết quả của Interactor thành các đối tượng có thể hiển thị bởi View.
4. Router:
  Router là thành phần chịu trách nhiệm điều hướng giữa các ViewControllers và truyền thông tin giữa chúng (Danh sách 6-5):
- Router chứa logic điều hướng (điều này khiến chúng ta loại bỏ nó khỏi ViewController).
- Nó giữ một tham chiếu yếu đến View (ViewController).
- Đây là một thành phần tùy chọn, vì ViewController của một màn hình có thể không có các tùy chọn điều hướng.
5. Services:
  Service là một lớp trừu tượng, về cơ bản, xử lý các hoạt động truy xuất thông tin từ cơ sở dữ liệu, yêu cầu API và tải xuống tệp:
- Mỗi Service nên có một chức năng duy nhất (Single Responsibility Principle).
- Một Interactor có thể gọi một hoặc nhiều Worker/Service.
- Chúng (Services) phải được thiết kế tổng quát để có thể được sử dụng bởi các Interactors khác nhau.
6. Model:
  Trong chu kỳ VIP, thông tin chạy theo một hướng duy nhất: từ View đến Interactor (dưới dạng Request), từ Interactor đến Presenter (dưới dạng Response), và trở lại View (dưới dạng ViewModel). Do đó, việc sử dụng một Model liên quan đến màn hình và chứa là rất phổ biến:
- RequestModel: Chứa các tham số để Interactor thực hiện các thao tác.
- ResponseModel: Chứa dữ liệu phù hợp được lấy bởi Workers và được chuyển đến Presenter.
- ViewModel: Chúng thường là dữ liệu kiểu nguyên thủy, được chuyển đến View để cập nhật nó.
