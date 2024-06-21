package com.chocoshop.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDto {
    private int productId; // 更新字段名称

    @NotBlank(message = "商品名稱不能為空")
    private String name;

    @NotBlank(message = "類別不能為空")
    private String category;

    @Min(value = 0, message = "價格不能為負")
    private int price;

    private String imageUrl;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
