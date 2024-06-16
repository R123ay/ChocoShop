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
        return "customer-detail";
    }

    @PostMapping("/add")
    public String addCustomer(@ModelAttribute Customer customer) {
        customerService.addCustomer(customer);
        return "redirect:/customers";
    }

    @PostMapping("/edit")
    public String editCustomer(@ModelAttribute Customer customer) {
        customerService.editCustomer(customer.getId(), customer);
        return "redirect:/customers";
    }

    @PostMapping("/delete/{id}")
    public String deleteCustomer(@PathVariable Integer id) {
        customerService.deleteCustomer(id);
        return "redirect:/customers";
    }
}
