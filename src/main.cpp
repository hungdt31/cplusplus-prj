#include "../includes/common.h"
#include "../includes/math_utils.h"

int main() {
    int a, b;
    
    // Đọc input từ stdin (cho phép chạy với nhiều test case)
    cin >> a >> b;
    
    // Tính toán và xuất kết quả ra stdout
    cout << "Sum = " << add(a, b) << endl;
    cout << "Product = " << multiply(a, b) << endl;
    
    return 0;
}