package com.chocoshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.chocoshop.model.po.Customer;
import com.chocoshop.service.CustomerService;

@Controller
@RequestMapping("/customers")
public class CustomerController {
    
    @Autowired
    private CustomerService customerService;
    
    @GetMapping
    public String getAllCustomers(Model model) {
        List<Customer> customers = customerService.getAllCustomers();
        model.addAttribute("customers", customers);
        return "customer";
    }

    @GetMapping("/{id}")
    public String getCustomerById(@PathVariable Integer id, Model model) {
        Customer customer = customerService.getCustomerById(id);
        model.addAttribute("customer", customer);
        return "customer-detail"; // Ensure you have customer-detail.jsp for this view
    }

    @GetMapping("/new")
    public String createCustomerForm(Model model) {
        model.addAttribute("customer", new Customer());
        return "customer-form";
    }

    @PostMapping
    public String createCustomer(@ModelAttribute Customer customer) {
        customerService.saveCustomer(customer);
        return "redirect:/customers";
    }

    @GetMapping("/{id}/edit")
    public String editCustomerForm(@PathVariable Integer id, Model model) {
        Customer customer = customerService.getCustomerById(id);
        model.addAttribute("customer", customer);
        return "customer-form";
    }

    @PostMapping("/{id}")
    public String updateCustomer(@PathVariable Integer id, @ModelAttribute Customer customer) {
        customer.setId(id);
        customerService.saveCustomer(customer);
        return "redirect:/customers";
    }

    @DeleteMapping("/{id}")
    public String deleteCustomer(@PathVariable Integer id) {
        customerService.deleteCustomer(id);
        return "redirect:/customers";
    }
}
