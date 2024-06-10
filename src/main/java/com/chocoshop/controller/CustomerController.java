package com.chocoshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.chocoshop.model.po.Customer;
import com.chocoshop.model.po.Product;
import com.chocoshop.service.CustomerService;
import com.chocoshop.service.ProductService;

@Controller
@RequestMapping("/customers")
public class CustomerController {
    
    @Autowired
    private CustomerService customerService;
    
    @Autowired
    private ProductService productService;
    
    // Retrieve all customers and display them on the JSP page
    @GetMapping
    public String getAllCustomers(Model model) {
        List<Customer> customers = customerService.getAllCustomers();
        List<Product> products = productService.getAllProducts();
        model.addAttribute("customers", customers);
        model.addAttribute("products", products);
        return "customer";
    }

    // Retrieve a specific customer by ID
    @GetMapping("/{id}")
    @ResponseBody
    public Customer getCustomerById(@PathVariable Integer id) {
        return customerService.getCustomerById(id);
    }

    // Add a new customer
    @PostMapping("/add")
    public String createCustomer(@RequestParam String name, 
                                 @RequestParam String email,
                                 @RequestParam String phone,
                                 Model model) {
        Customer customer = new Customer();
        customer.setName(name);
        customer.setEmail(email);
        customer.setPhone(phone);
        customerService.saveCustomer(customer);
        return "redirect:/customers";
    }

    // Update an existing customer
    @PostMapping("/update")
    public String updateCustomer(@RequestParam Integer id,
                                 @RequestParam String name,
                                 @RequestParam String email,
                                 @RequestParam String phone,
                                 Model model) {
        Customer customer = customerService.getCustomerById(id);
        customer.setName(name);
        customer.setEmail(email);
        customer.setPhone(phone);
        customerService.saveCustomer(customer);
        return "redirect:/customers";
    }

    // Delete a customer by ID
    @PostMapping("/delete")
    public String deleteCustomer(@RequestParam Integer id) {
        customerService.deleteCustomer(id);
        return "redirect:/customers";
    }
}
