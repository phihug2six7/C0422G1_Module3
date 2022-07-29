package service;

public class Calculator {
    public static float calculator(float firstOperand, float secondOperand, String operator) {
        switch (operator) {
            case "+":
                return firstOperand + secondOperand;
            case "-":
                return firstOperand - secondOperand;
            case "*":
                return firstOperand * secondOperand;
            case "/":
                if (secondOperand != 0) {
                    return firstOperand / secondOperand;
                } else {
                    throw new ArithmeticException("Số thứ 2 không được bằng 0");
                    //lỗi chia cho số 0
                }
            default:
                throw new ArithmeticException("Bạn đã nhập sai định dạng");
        }
    }
}
