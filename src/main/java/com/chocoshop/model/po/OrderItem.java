package com.chocoshop.model.po;

public class OrderItem {
    private Integer id; // 訂單項目ID
    private Integer orderId; // 訂單ID
    private Integer productId; // 產品ID
    private Integer quantity; // 數量

    // 取得訂單項目ID
    public Integer getId() {
        return id;
    }

    // 設定訂單項目ID
    public void setId(Integer id) {
        this.id = id;
    }

    // 取得訂單ID
    public Integer getOrderId() {
        return orderId;
    }

    // 設定訂單ID
    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    // 取得產品ID
    public Integer getProductId() {
        return productId;
    }

    // 設定產品ID
    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    // 取得數量
    public Integer getQuantity() {
        return quantity;
    }

    // 設定數量
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}
